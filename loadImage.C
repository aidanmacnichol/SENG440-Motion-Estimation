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
320 / 16 = 20 blocks in the x direction 
240 / 16 = 15 blocks in the y direciton 

*/
void SAD(int A, int B){
    int A[16][16], B[16][16], diff, sad = 0; 
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
}

int main() {
    // Load reference frame
    loadImg reference;
    loadImage(&reference, "reference.txt")

    for(int i = 0; i < 16)
    int[16][16] =
    SAD(&reference)

    //Load forward frame 
    loadImg forward;
    loadImage(&forward, "forward.txt");


    printArray(&forward);

    return 0;
}
