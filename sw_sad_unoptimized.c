#include <stdio.h>
/*
Perform SAD on two 16x16 blocks, B is the reference block and A is the current comparison block

(x,y) is the position of current block
(r,s) is the motion vector (displacement of current block A relative to reference block B)
*/

int SAD(int A[16][16], int B[16][16], int x, int y, int r, int s, int bestMatch){
    int diff, sad = 0; 
    int i, j; 
    for(i=0; i<16; i++){
        for(j=0; j<16; j++){
            diff = A[x+i][y+j] - B[(x+r) + i][(y+s) + j]; 
            if(diff < 0){
                diff -= diff;
            } 
        sad += diff; 
        }
    }
    //printf("SAD: %d\n", sad);
    // Check if current SAD is better than the best match
    if(sad < bestMatch){
        bestMatch = sad;
    }
    return bestMatch; 
}
