#include <stdio.h>
#include <time.h>
#include "sad.c"

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


int main() {
    //ARM compiler does not like declaring a variable within a for loop so its done here
    int i, j, x, y; 
    int blockA[16][16]; // current block for comparison
    int blockB[16][16]; //reference block *currently static*
    int bestMatch = 200; //Keeping track of lowest SAD

    // Load reference frame
    loadImg reference;
    loadImage(&reference, "reference.txt");

    //Load forward frame 
    loadImg forward;
    loadImage(&forward, "forward.txt");


    // Load reference block
    // I want to load the first 16x16 block of the reference array into a new one
    for(i = 0; i < 16; i++){
        for(j = 0; j < 16; j++){
            blockB[i][j] = reference.array[i][j];
        }
    }

    /*
    (320 - 16 = 304)
    (240 - 16 = 224)
    top left pixel is the reference pixel.
    These x,y loops loop through all possible x,y positions of the forward frame (block A)
    */

//--------------Software SAD-----------------------------------------------------------------------------------------------
    // Clock to keep track of execution time
    clock_t start, end; 
    double execution_time; 
    start = clock(); 

    for(x = 1; x < 304; x++){
        for(y = 1; y < 224; y++){

            // Load 16x16 block A from forward image
            for(i = 0; i < 16; i++){
                for(j = 0; j < 16; j++){
                    blockA[i][j] = forward.array[i][j];
                }
            }
        // Perform SAD current block
        // in this example with only one reference block the current position is the same as the motion vector
        bestMatch = SAD(blockA, blockB, 0, 0, 0, 0, bestMatch);
        
        }
    }

    // print lowest SAD value *add motion vector here*
    printf("Best Match: %d\n", bestMatch);

    // end and print execution time
    end = clock(); 
    execution_time = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("Execution Time - unoptimized SAD: %f\n", execution_time);

//-----------Unrolled Software SAD------------------------------------------------------------------------------------------

    // Clock to keep track of execution time
    clock_t start2, end2; 
    double execution_time2; 
    start2 = clock(); 

    for(x = 1; x < 304; x++){
        for(y = 1; y < 224; y++){

            // Load 16x16 block A from forward image
            for(i = 0; i < 16; i++){
                for(j = 0; j < 16; j++){
                    blockA[i][j] = forward.array[i][j];
                }
            }
        // Perform SAD current block
        // in this example with only one reference block the current position is the same as the motion vector
        bestMatch = SAD_unrolled(blockA, blockB, 0, 0, 0, 0, bestMatch);
        
        }
    }
    end2 = clock(); 
    execution_time2 = ((double) (end2 - start2)) / CLOCKS_PER_SEC;
    printf("Execution Time - unrolled SAD: %f\n", execution_time2);


    return 0;
}
