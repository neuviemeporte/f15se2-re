int a[64][64];

int main() {
    int x = 5, y = 6;
    for (x = 0; x < 63; x++)
        for (y = 0; y < 63; y++)
            a[x][y] = 123;
    return 0;
}