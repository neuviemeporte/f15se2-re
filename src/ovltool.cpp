#include <iostream>
#include <fstream>
#include <cstdint>
#include <string>
#include <vector>
#include <algorithm>
#include <regex>
#include <sys/stat.h>

using namespace std;
using Word = uint16_t;

#pragma pack(push, 1)
struct MzHeader {
    Word signature;            // 0x00, == 0x5A4D ("MZ")
    Word last_page_size;       // 0x02, any remainder < 512 in the last page
    Word pages_in_file;        // 0x04, each page is 512 bytes
    Word num_relocs;           // 0x06, size of relocation table
    Word header_paragraphs;    // 0x08, length of header, indicates offset of load module within the exe
    Word min_extra_paragraphs; // 0x0a, minimum required memory
    Word max_extra_paragraphs; // 0x0c, max program would like
    Word ss;                   // 0x0e, paragraph addr of stack relative to load module
    Word sp;                   // 0x10, does not need to be relocated
    Word checksum;             // 0x12, rarely used
    Word ip;                   // 0x14, does not need to be relocated
    Word cs;                   // 0x16, relocated at load time by adding by adding addr of start segment to it
    Word reloc_table_offset;   // 0x18, from start of file
    Word overlay_number;       // 0x1a, rarely used
} header_;
static_assert(sizeof(MzHeader) == 28, "Invalid EXE header size");

// Microprose overlay header format
struct OvlHeader {
    uint8_t description[0x18]; // 00h-17h: description
    uint16_t header_paragraphs; // 18h-19h: total number of header paragraphs, after relocation becomes segment pointer into code
    uint16_t base_segment; // 1ah-1bh: base load segment of overlay (relocated)
    uint16_t first_slot; // 1ch-1dh: slot index (id) of first jump entry 
    uint16_t size1; // 1eh-1fh: size1
    uint16_t size2; // 20h-21h: size2
    uint16_t jump_count; // 22h-23h: number of jump addresses 
    // 24h-...: array of jump offsets
    // Extra description or padding data follows
};
static_assert(sizeof(OvlHeader) == 0x18 + 12, "Invalid OVL header size");
#pragma pack(pop)

// size of a jump table slot in the excutable: JMP opcode (1b) + offset (2b) + segment (2b)
constexpr size_t SLOT_SIZE = 5;

struct Slot {
    size_t idx;
    size_t origin;
    Word jump;
};

int fileSize(const string &path) {
    struct stat s;
    if (stat(path.c_str(), &s) != 0) return -1;
    else return static_cast<int>(s.st_size);
}

size_t slotInfo(const vector<Slot> &slots) {
    size_t maxOrigin = 0;
    cout << "--- jump offsets:" << endl;    
    for (const auto &s: slots) {
        cout << "[0x" << hex << s.origin << "]: slot 0x" << hex << s.idx << ", offset 0x" << hex << s.jump << endl;
        if (s.origin > maxOrigin) maxOrigin = s.origin;
    } 
    return maxOrigin;
}

void patchExe(const smatch &arg, const OvlHeader &ovh, const vector<Slot> &slots) {
    // patch exe file with jump offsets
    const string exePath = arg[1].str();
    const size_t exeOffset = stoul(arg[2].str(), nullptr, 16) + ovh.first_slot * SLOT_SIZE;
    const auto segVal = stoul(arg[3].str(), nullptr, 16);
    if (segVal > UINT16_MAX) {
        cout << "Patch segment value out of uint16 range: 0x" << hex << segVal << endl;
        exit(1);
    }
    const size_t jumpTableLen = ovh.jump_count * 5; // each jump entry in exe to patch is 5 bytes: JMP opcode (1b), offset (2b), segment(2b)
    const Word segWord = static_cast<Word>(segVal);
    const size_t exePatchEnd = exeOffset + jumpTableLen;
    cout << "Patching file " << exePath << " at offset 0x" << hex << exeOffset << ", table len = 0x" << hex << jumpTableLen << " - end at 0x" << exePatchEnd << endl;
    const int exeSize = fileSize(exePath);
    if (exeSize < 0) {
        cout << "Unable to open file for patching: " << exePath << endl;
        exit(1);
    }
    if (exeSize < exePatchEnd) {
        cout << "File size " << exeSize << " too small for patching up to 0x" << hex << exePatchEnd << endl;
        exit(1);
    }

    fstream exeFile{exePath, ios::in | ios::out | ios::binary};
    if (!exeFile.is_open()) {
        cout << "Error opening file for patching: " << exePath << endl;
        exit(1);
    }
    exeFile.seekg(exeOffset, ios_base::beg);
    for (const auto &s: slots) {
        uint8_t opcode;
        // verify that there is the JMP opcode at the slot location
        const auto readOfs = exeFile.tellg();
        exeFile.read(reinterpret_cast<char*>(&opcode), 1);
        if (opcode != 0xea) {
            cout << "Unexpected opcode: 0x" << hex << static_cast<int>(opcode) << " at offset 0x" << hex << readOfs << endl;
            exit(1);
        }
        cout << "Patching slot 0x" << hex << s.idx << " jump location of " << hex << segWord << ":" << hex << s.jump << " at exe offset 0x" << hex << exeFile.tellp() << endl;
        exeFile.write(reinterpret_cast<const char*>(&s.jump), 2); // write offset word
        exeFile.write(reinterpret_cast<const char*>(&segWord), 2); // write segment word
    }
}

// write sequence of IDC (C-like scripting language for IDA) commands to patch reversed binary in the tool
void generateIdc(const smatch &arg, const OvlHeader &ovh, const vector<Slot> &slots) {
    const size_t startAddr = stoul(arg[1].str(), nullptr, 16) + ovh.first_slot * SLOT_SIZE;
    const size_t segVal = stoul(arg[2].str(), nullptr, 16);
    if (segVal > UINT16_MAX) {
        cout << "Invalid segment value for IDC patching: 0x" << hex << segVal << endl;
        exit(1);
    } 
    const string scriptName = "patch.idc";
    cout << "Outputing patch commands to " << scriptName << ", starting offset 0x" << hex << startAddr << endl;
    size_t curAddr = startAddr;
    ofstream script{scriptName};
    for (const auto &s: slots) {
        script << "\t// slot 0x" << hex << s.idx << endl;
        script << "\tPatchWord(0x" << hex << curAddr + 1 << ",0x" << hex << s.jump << ");" << endl;
        script << "\tPatchWord(0x" << hex << curAddr + 3 << ",0x" << hex << segVal << ");" << endl;
        curAddr += SLOT_SIZE;
    }
    script.close();
}

int main(int argc, char *argv[]) {
    if (argc < 2 || argc > 3) {
        cout << "Syntax: " << argv[0] << " overlay_file [exe_to_patch,exe_offset,segment_value]" << endl;
        return 1;
    }
    const string ovlFilename{argv[1]};
    ifstream ovlFile(ovlFilename, ios::binary);
    if (!ovlFile.is_open()) {
        cout << "Unable to open OVL file " << ovlFilename << endl;
        return 1;
    }
    MzHeader mzh;
    ovlFile.read(reinterpret_cast<char*>(&mzh), sizeof(mzh));
    size_t loadModuleOffset = mzh.header_paragraphs * 16;
    ovlFile.seekg(loadModuleOffset);
    OvlHeader ovh;
    ovlFile.read(reinterpret_cast<char*>(&ovh), sizeof(ovh));
    size_t descLen = 0;
    for (size_t i = 0; i < 0x18; ++i) { if (ovh.description[i] != 0) descLen++; }
    string ovlDesc{reinterpret_cast<char*>(ovh.description), descLen};
    cout << "[0x" << hex << offsetof(OvlHeader, description) << "] description: '" << ovlDesc << "'" << endl
         << "[0x" << hex << offsetof(OvlHeader, header_paragraphs) << "] header_paragraphs = " << ovh.header_paragraphs << " / 0x" << hex << ovh.header_paragraphs * 16 << " bytes " << endl
         << "[0x" << hex << offsetof(OvlHeader, base_segment) << "] base_segment = 0x" << hex << ovh.base_segment << endl
         << "[0x" << hex << offsetof(OvlHeader, first_slot) << "] first_slot = 0x" << hex << ovh.first_slot << endl
         << "[0x" << hex << offsetof(OvlHeader, size1) << "] size1 = 0x" << hex << ovh.size1 << endl
         << "[0x" << hex << offsetof(OvlHeader, size2) << "] size2 = 0x" << hex << ovh.size2 << endl
         << "\ttotal size = 0x" << hex << ovh.size1 + ovh.size2 << endl
         << "[0x" << hex << offsetof(OvlHeader, jump_count) << "] jump_count = " << dec << ovh.jump_count << endl;
    
    // retrieve, sort and display jump slots
    vector<Slot> slots;
    size_t tableOffset = sizeof(ovh);
    for (size_t i = 0; i < ovh.jump_count; ++i) {
        Word jumpaddr;
        ovlFile.read(reinterpret_cast<char*>(&jumpaddr), sizeof(jumpaddr));
        const size_t origin = tableOffset + i * sizeof(jumpaddr);
        slots.emplace_back(Slot{ i + ovh.first_slot, origin, jumpaddr });
    }

    // exit if no patch argument
    if (argc < 3) { 
        // sort by jump offset
        // sort(slots.begin(), slots.end(), [](const Slot &s1, const Slot &s2) {
        //     return s1.jump < s2.jump;
        // });
        const size_t maxOrigin = slotInfo(slots); 
        cout << "Lowest offset 0x" << hex << slots.front().jump << ", highest 0x" << hex << slots.back().jump << endl
            << "Jump offsets end at 0x" << hex << maxOrigin + 2 << endl;
        return 0; 
    }

    // patch exe file with jump offsets or generate IDC listing for patching
    // sort slots by index
    sort(slots.begin(), slots.end(), [](const Slot &s1, const Slot &s2){
        return s1.idx < s2.idx;
    });
    slotInfo(slots);
    const string patchArg{argv[2]};
    const regex PATCHEXE_RE{"([-_.a-z0-9]+),([x0-9a-f]+),([x0-9a-f]+)", regex_constants::icase};
    const regex IDC_RE{"idc,([0-9a-f]+),([0-9a-f]+)", regex_constants::icase};
    smatch match;
    if (regex_match(patchArg, match, IDC_RE)) generateIdc(match, ovh, slots);
    else if (regex_match(patchArg, match, PATCHEXE_RE)) patchExe(match, ovh, slots);
    else {
        cout << "Unrecognized argument: " << patchArg << endl;
        return 1;
    }

    return 0;
}