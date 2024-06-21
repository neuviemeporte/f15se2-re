#include <iostream>
#include <cstdint>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <cstring>

#include "struct.h"
#include "const.h"

using namespace std;

static_assert(sizeof(Buf4Item) == BUF4ITEMSIZE, "Invalid buf4 item size");
static_assert(sizeof(Buf6Item) == BUF6ITEMSIZE, "Invalid buf6 item size");

template <typename T> string hexStr(const T &value) {
    ostringstream str;
    str << "0x" << hex << value << "/" << dec << value;
    return str.str();
}

    
void hexDump(const unsigned char *buf, const size_t size, const size_t off = 0, const bool header = true) 
{
    if (header) cout << std::hex << std::setfill('0') << "buf[0x" << size 
            << "] @ 0x" << reinterpret_cast<size_t>(buf) 
            << " + 0x" << off << ": " << endl;
    if (!buf || !size || off >= size) return;
    const size_t bpl = 16; // display bytes per line
    const size_t limit = 50 * bpl;
    if (size - off > 2 * limit) {
        hexDump(buf, limit, 0, false);
        cout << "[...]" << endl;
        hexDump(buf, size, size - limit, false);
        return;
    }
    for (size_t i = 0; i + off < size; ++i) {
        const size_t pos = i % bpl;
        if (pos == 0) { // header at line start
            cout << "0x" << std::setw(8) << std::setfill('0') << i + off << ": ";
        }
        // hex byte
        cout << hex << std::setw(2) << static_cast<int>(buf[i + off]) << " ";
        if (pos + 1 == bpl || i + 1 == size) { // ascii dump at line or buffer end
            for (size_t j = 1; j <= bpl; ++j) {
                if (pos + j < bpl) { cout << "   "; continue; }
                const unsigned char c = buf[i + off - bpl + j];
                if (c >= 0x20 && c <= 0x7e) cout << c;
                else cout << ".";
            }
            cout << endl;
        }
    }
}

void parseWorld(ifstream &ifs) {
    uint16 buf1;
    ifs.read(reinterpret_cast<char*>(&buf1), sizeof(buf1));
    cout << "--- buf1 = " << hexStr(buf1) << endl;
    uint16 buf4count;
    ifs.read(reinterpret_cast<char*>(&buf4count), sizeof(buf4count));
    cout << "--- buf4count = " << hexStr(buf4count) << endl;
    uint16 buf2;
    ifs.read(reinterpret_cast<char*>(&buf2), sizeof(buf2));
    cout << "--- buf2 = " << hexStr(buf2) << endl;    
    uint16 buf3;
    ifs.read(reinterpret_cast<char*>(&buf3), sizeof(buf3));
    cout << "--- buf3 = " << hexStr(buf3) << endl;
    char buf4data[BUF4ITEMSIZE];
    for (uint16 i = 0; i < buf4count; ++i) {
        cout << "--- buf4 item " << i << ":" << endl;
        ifs.read(buf4data, BUF4ITEMSIZE);
        Buf4Item item;
        memcpy(&item, buf4data, sizeof(item));
        cout << "field_0 = " << hexStr(item.field_0) << endl
             << "field_2 = " << hexStr(item.field_2) << endl
             << "field_4 = ";
        hexDump(reinterpret_cast<uint8*>(item.field_4), sizeof(item.field_4), 0, false);
        cout << "field_8 = ";
        hexDump(reinterpret_cast<uint8*>(item.field_8), sizeof(item.field_8), 0, false);
    }
    uint16 buf6count;
    ifs.read(reinterpret_cast<char*>(&buf6count), sizeof(buf6count));
    cout << "--- buf6count = " << hexStr(buf6count) << endl;    
    char buf6data[BUF6ITEMSIZE];
    for (uint16 i = 0; i < buf6count; ++i) {
        cout << "--- buf6 item " << i << ":" << endl;
        ifs.read(buf6data, BUF6ITEMSIZE);
        Buf6Item item;
        memcpy(&item, buf6data, sizeof(item));
        cout << "field_0 = " << hexStr(item.field_0) << endl
             << "field_2 = " << hexStr(item.field_2) << endl
             << "field_4 = ";
        hexDump(reinterpret_cast<uint8*>(item.field_4), sizeof(item.field_4), 0, false);
        cout << "field_16 =" << hexStr(item.field_16) << endl
             << "field_18 =";
        hexDump(reinterpret_cast<uint8*>(item.field_18), sizeof(item.field_18), 0, false);
        cout << "field_1C =";
        hexDump(reinterpret_cast<uint8*>(item.field_1C), sizeof(item.field_1C), 0, false);
    }
    char buf7data[BUF7SIZE];
    ifs.read(buf7data, BUF7SIZE);
    cout << "--- buf7:" << endl;
    hexDump(reinterpret_cast<uint8*>(buf7data), BUF7SIZE);
    ifs.read(buf7data, BUF7SIZE);
    cout << "--- buf8:" << endl;
    hexDump(reinterpret_cast<uint8*>(buf7data), BUF7SIZE);
    ifs.read(buf7data, BUF7SIZE);
    cout << "--- buf9:" << endl;
    hexDump(reinterpret_cast<uint8*>(buf7data), BUF7SIZE);
    char buf10data[BUF10SIZE];
    ifs.read(buf10data, BUF10SIZE);
    cout << "--- buf10:" << endl;
    hexDump(reinterpret_cast<uint8*>(buf10data), BUF10SIZE);
    char buf11data[WORLD_BUFSZ];
    ifs.read(buf11data, WORLD_BUFSZ);
    cout << "--- buf11:" << endl;
    hexDump(reinterpret_cast<uint8*>(buf11data), WORLD_BUFSZ);    
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        cout << "Syntax: wldparse path/to/file.wld" << endl;
        exit(1);
    }
    string path(argv[1]);
    ifstream ifs(path, ios::binary);
    if (!ifs) {
        cout << "Unable to open file: " << path << endl;
        exit(1);
    }
    parseWorld(ifs);
    return 0;
}