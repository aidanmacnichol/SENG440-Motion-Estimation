#include <stdio.h> 

int sw_SAD_optimized(int A[16][16], int B[16][16], int x, int y, int r, int s, int bestMatch) {
    int diff1, diff2, sad = 0;
    int i, j;

    for (i = 0; i < 16; i++) {
        for (j = 0; j < 16; j += 2) {
            diff1 = A[x + i][y + j] - B[(x + r) + i][(y + s) + j];
            diff2 = A[x + i][y + j + 1] - B[(x + r) + i][(y + s) + j + 1];

            // Guarded Operations
            sad += (diff1 < 0) ? -diff1 : diff1;
            sad += (diff2 < 0) ? -diff2 : diff2;
        }
    }

    if (sad < bestMatch) {
        bestMatch = sad;
    }

    return bestMatch;
}