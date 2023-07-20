#include <stdio.h>


typedef struct {
    int array[320][240];
} loadImg;

/*
Load greyscale pixel values into a 320x240 array of integers given a filename
*/
void loadImage(loadImg* img, const char* filename) {
    int i, j;

    //Open file, return error if it cannot
    FILE* file = fopen(filename, "r");
    if (!file) {
        printf("Error opening file: %s\n", filename);
        return;
    }
    // Write pixel values to array
    for (i = 0; i < 320; i++) {
        for (j = 0; j < 240; j++) {
            fscanf(file, "%d", &img->array[i][j]);
        }
    }
    fclose(file);
}

/*
Print array for testing purposes
*/
void printArray(loadImg* img) {
    int i, j;
    for (i = 0; i < 320; i++) {
        for (j = 0; j < 240; j++) {
            printf("%d ", img->array[i][j]);
        }
        printf("\n");
    }
}


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

int main() {
    // Load reference frame
    loadImg reference;
    loadImage(&reference, "reference.txt");

    // Load reference block

    // I want to load the first 16x16 block of the reference array into a new one
    int blockB[16][16];

    for(int i = 0; i < 16; i++){
        for(int j = 0; j < 16; j++){
            blockB[i][j] = reference.array[i][j];
        }
    }

    //Load forward frame 
    loadImg forward;
    loadImage(&forward, "forward.txt");

    int blockA[16][16];


    /*
    (320 - 16 = 304)
    (240 - 16 = 224)
    top left pixel is the reference pixel.
    These x,y loops loop through all possible x,y positions of the forward frame (block A)
    */

    int bestMatch = 200; 

    for(int x = 1; x < 304; x++){
        for(int y = 1; y < 224; y++){

            // Load 16x16 block A from forward image
            for(int i = 0; i < 16; i++){
                for(int j = 0; j < 16; j++){
                    blockA[i][j] = forward.array[i][j];
                }
            }
        // Perform SAD current block
        // in this example with only one reference block the current position is the same as the motion vector
        bestMatch = SAD(blockA, blockB, x, y, x, y, bestMatch);
        
        }
    }

    printf("Best Match: %d\n", bestMatch);

    return 0;
}
