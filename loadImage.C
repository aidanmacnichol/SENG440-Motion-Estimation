#include <stdio.h>
#include <time.h>
#include "sw_sad_unoptimized.c"
#include "sw_sad_loop_unrolled.c"
#include "hw_sad_reentrant.c"

#define sw_sad_unoptimized 0
#define sw_sad_unrolled 1
#define hw_sad_reentrant 2
#define hw_sad_nonreentrant 3

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

    // Choose what code to run
    int state = sw_sad_unoptimized; 


    //ARM compiler does not like declaring a variable within a for loop so its done here
    int i, j, x, y; 
    int blockA[16][16]; // current block for comparison
    int blockB[16][16]; //reference block *currently static*
    int bestMatch = 200; //Keeping track of lowest SAD

    clock_t start, end; 
    double execution_time; 

    // Load reference frame
    loadImg reference;
    loadImage(&reference, "reference.txt");

    //Load forward frame 
    loadImg forward;
    loadImage(&forward, "forward.txt");

    switch(state)
    {

//--------------Software SAD UNOPTIMIZED-----------------------------------------------------------------------------------------------        
        case sw_sad_unoptimized:

            // Load reference block
            for(i = 0; i < 16; i++){
                for(j = 0; j < 16; j++){
                    blockB[i][j] = reference.array[i][j];
                }
            }

            start = clock(); 
        
            // Searches blocks 3 out from the reference position
            for(x = 16; x < 64; x+=16){
                for(y = 16; y < 64; y+=16){
                
                    // Load 16x16 block A from forward image
                    for(i = 0; i < 16; i++){
                        for(j = 0; j < 16; j++){
                            blockA[i][j] = forward.array[i+x][j+y];
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
                    printf("Execution Time - SW SAD unoptimized: %f\n", execution_time);
                    
                    break; 


//-----------Unrolled Software SAD------------------------------------------------------------------------------------------        
        case sw_sad_unrolled: 

            // Load reference block
            for(i = 0; i < 16; i++){
                for(j = 0; j < 16; j++){
                    blockB[i][j] = reference.array[i][j];
                }
            }

            // start clock
            start = clock(); 

            for(x = 16; x < 64; x+=16){
                for(y = 16; y < 64; y+=16){
                
                    // Load 16x16 block A from forward image
                    for(i = 0; i < 16; i++){
                        for(j = 0; j < 16; j++){
                            blockA[i][j] = forward.array[i+x][j+y];
                        }
                    }
                // Perform SAD current block
                // in this example with only one reference block the current position is the same as the motion vector
                bestMatch = SAD_unrolled(blockA, blockB, 0, 0, 0, 0, bestMatch); 
                }
            }

            // print lowest SAD value *add motion vector here*
            printf("Best Match: %d\n", bestMatch);

            // end and print execution time
            end = clock(); 
            execution_time = ((double) (end - start)) / CLOCKS_PER_SEC;
            printf("Execution Time - SW SAD unrolled: %f\n", execution_time);

            break; 
    


//--------------HW SAD---------------------------------------------------------------------------------------
   // Clock to keep track of execution time 

    case hw_sad_nonreentrant:
        ; 
        uint8_t blockB_hw[4][16];
        uint8_t blockA_hw[4][16]; 
        int result; 

        // Load Reference block
        for(i = 0; i < 4; i++){
            for(j = 0; j < 16; j++){
                blockB_hw[i][j] = reference.array[i][j];
            }
        }

        start = clock();

        for(x = 16; x < 64; x += 16){
            for(y=4; y < 64; y+=4){

                //Load forward block
                for(i = 0; i < 4; i++){
                    for(j = 0; j < 16; j++){
                        blockA_hw[i][j] = forward.array[i+x][j+y]; 
                    }
                }
            }
            result = neon_sad_block_8x8((uint8_t*)blockA_hw, (uint8_t*)blockB_hw);
            printf("HW TEST RESULT: %d\n", result); 
        }


        printf("HW TEST RESULT: %d\n", result); 
        end = clock(); 
        // printf("clocks: %d, %d\n", (int)end, (int)start); 
        execution_time = ((double)(end - start)) / CLOCKS_PER_SEC;
        printf("Execution Time - hw SAD: %f\n", execution_time);

        break; 

    } //end switch 
    return 0;
}