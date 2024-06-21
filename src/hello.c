unsigned int word_1C830;
unsigned int word_1C82C;
long dword_1D650;

void func1() {
    long var_30, var_34;
    // var_34 = (long)((word_1C830 & 0x200) ? 0 : 0x708);
    // var_30 = 0x8000 - (long)word_1C82C;
    var_34 = (var_30 = 0x8000 - (long)word_1C82C), (long)((word_1C830 & 0x200) ? 0 : 0x708);
    dword_1D650 = (var_30 << 5) - var_34;
    // dword_1D650 = ((var_30 = 0x8000 - (long)word_1C82C) << 5) - (var_34 = (long)((word_1C830 & 0x200) ? 0 : 0x708));
    //var_34 = (long)((word_1C830 & 0x200) ? 0 : 0x708);    
    /*
    1. ax:dx = A: (long)(0x0 / 0x708)
    2. cx:bx = B: 0x8000 - word_1c82c
    3. var_B = cx:bx
    x. cl = 5 
    4. var_A = ax:dx
    5. ax:dx = var_B
    6. ax:dx << 5
    7. ax:dx -= var_A
    8. dword_1d650 = ax:dx ((B << 5) - A
    */
}

int a[6], b[6];
void func6() {
    int i;
    for (i = 0; i < sizeof(a); ++i) {
        a[i] = b[i];
    }
}

int difficultySaved;
struct Game {
    int flag4;
    char foo;
    int bar;
};

struct Game g[10];
void func5() {
    int i;
    for (i = 0; i <10; ++i) {
        g[i].flag4 = 1;
        g[i].foo = 'a';
        g[i].bar = 0x100; 
    }
}

// startCode1:49CB			mov	ax, 5
// startCode1:49CE			push	ax
// startCode1:49CF			call	randMul
// startCode1:49D2			add	sp, 2
// startCode1:49D5			les	bx, gameData
// startCode1:49D9			mov	cx, ax
// startCode1:49DB			cmp	word ptr es:[bx+3Ah], 1
// startCode1:49E0			sbb	ax, ax
// startCode1:49E2			inc	ax
// startCode1:49E3			add	ax, cx
// startCode1:49E5			add	ax, difficultySaved
// startCode1:49E9			jmp	short switch_14A0D
// [...]
// startCode1:4A0D
// startCode1:4A0D	switch_14A0D:				; CODE XREF: sub_14093+956j
// startCode1:4A0D			cmp	ax, 8
// startCode1:4A10			ja	short case246_14A2C
// startCode1:4A12			add	ax, ax
// startCode1:4A14			xchg	ax, bx
// startCode1:4A15			jmp	cs:off_14A1A[bx]
// startCode1:4A15	; ---------------------------------------------------------------------------
// startCode1:4A1A	off_14A1A	dw offset case013_149EB	; DATA XREF: sub_14093+982r
// startCode1:4A1C			dw offset case013_149EB
// startCode1:4A1E			dw offset case246_14A2C
// startCode1:4A20			dw offset case013_149EB
// startCode1:4A22			dw offset case246_14A2C
// startCode1:4A24			dw offset case578_149FB
// startCode1:4A26			dw offset case246_14A2C
// startCode1:4A28			dw offset case578_149FB
// startCode1:4A2A			dw offset case578_149FB
struct Game far *gameData;
void func3();
int foo;
void func4() {
    switch((gameData->flag4 != 0) + func3(5) + difficultySaved) {
    case 0:
    case 1:
    case 3:
        foo = 6;
        break;
    case 2:
    case 4:
    case 6:
        foo = 7;
        break;
    case 5:
    case 7:
    case 8:
        foo = 123;
    }
}

int main() {

    return 0;
}

// startCode1:47D0			mov	ax, [bp+var_20] ; ax = 9123 (-28381)
// startCode1:47D3			cwd                 ; dx = ffff (-1)
// startCode1:47D4			xor	ax, dx          ; ax = 6edc (28380)
// startCode1:47D6			sub	ax, dx          ; ax = 6edd (28381)
// startCode1:47D8			mov	cx, 2
// startCode1:47DB			sar	ax, cl          ; ax = 1bb7 (7095)
// startCode1:47DD			xor	ax, dx          ; ax = e448 (-7096)
// startCode1:47DF			sub	ax, dx          ; ax = e449 (-7095)
// startCode1:47E1			mov	cx, 4
// startCode1:47E4			sub	cx, difficultySaved ; cx = 3
// startCode1:47E8			imul	cx              ; ax = acdb (-21285)
// startCode1:47EA			mov	[bp+var_14], ax
void func3() {
    int var_20;
    int var_14;
    var_14 = (var_20 / 4) * (4 - difficultySaved);
}

// startCode1:4784			mov	ax, word_182BE
// startCode1:4787			mov	cl, 0Ah
// startCode1:4789			shr	ax, cl
// startCode1:478B			shl	ax, cl
// startCode1:478D			add	ah, 2
// startCode1:4790			mov	word_182BE, ax
unsigned int word_182BE;
int func2() {
    word_182BE = ((word_182BE >> 0xa) << 0xa) + 0x200;
}

// 000046BD  8B8CDC5C          mov cx,[si+0x5cdc] ; 42c0 (17088)
// 000046C1  2BDB              sub bx,bx          ; 0
// 000046C3  81E90080          sub cx,0x8000      ; cx = c2c0 (49856), c = 1
// 000046C7  1BDB              sbb bx,bx          ; bx = ffff 
// 000046C9  F7D9              neg cx             ; cx = 3d40 (15680)
// 000046CB  83D300            adc bx,byte +0x0   ; bx = 0
// 000046CE  F7DB              neg bx             ; bx = 0
// 000046D0  894ED0            mov [bp-0x30],cx   ; 3d40
// 000046D3  895ED2            mov [bp-0x2e],bx   ; 0
// [...]
// 000046AD  F784E05C0002      test word [si+0x5ce0],0x200
// 000046B3  7404              jz 0x46b9
// 000046B5  2BC0              sub ax,ax
// 000046B7  EB03              jmp short 0x46bc
// 000046B9  B80807            mov ax,0x708
// 000046BC  99                cwd                 ; ax:dx = (long)0x708
// 000046BD  8B8CDC5C          mov cx,[si+0x5cdc]   
// 000046C1  2BDB              sub bx,bx           ; cx:bx = (long)word_1c82c
// 000046C3  81E90080          sub cx,0x8000
// 000046C7  1BDB              sbb bx,bx
// 000046C9  F7D9              neg cx
// 000046CB  83D300            adc bx,byte +0x0
// 000046CE  F7DB              neg bx              ; cx:bx = 0x8000 - word_1c82c 
// 000046D0  894ED0            mov [bp-0x30],cx    ; var_30 = cx:bx
// 000046D3  895ED2            mov [bp-0x2e],bx
// 000046D6  B105              mov cl,0x5
// 000046D8  8946CC            mov [bp-0x34],ax    ; var_34 = ax:dx 
// 000046DB  8956CE            mov [bp-0x32],dx
// 000046DE  8B46D0            mov ax,[bp-0x30]
// 000046E1  8BD3              mov dx,bx           ; ax:dx = var_30
// 000046E3  D1E0              shl ax,1
// 000046E5  D1D2              rcl dx,1
// 000046E7  FEC9              dec cl
// 000046E9  7402              jz 0x46ed           ; ax:dx <<= 5 
// 000046EB  EBF6              jmp short 0x46e3
// 000046ED  2B46CC            sub ax,[bp-0x34]    ; ax:dx -= var_34
// 000046F0  1B56CE            sbb dx,[bp-0x32]
// 000046F3  A3006B            mov [0x6b00],ax     : dword_d650 = ax:dx
// 000046F6  8916026B          mov [0x6b02],dx
