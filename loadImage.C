#include <stdio.h>
#include <time.h>
#include "sw_sad_unoptimized.c"
#include "sw_sad_loop_unrolled.c"
#include "sw_sad_optimized.c"
#include "hw_sad_nonreentrant.c"
#include "hw_sad_reentrant.c"



//For the switch statement
#define SW_SAD_UNOPTIMIZED 0
#define SW_SAD_UNROLLED 1
#define SW_SAD_OPTIMIZED 2
#define HW_SAD_NONREENTRANT 3
#define HW_SAD_REENTRANT 4

typedef struct {
    int array[320][240];
} loadImg;

/*
Load greyscale pixel values into a 320x240 array of integers given a filename
*/
void loadImage(loadImg* img, const char* filename) {
    int x, y;

    //Open file, return error if it cannot
    FILE* file = fopen(filename, "r");
    if (!file) {
        printf("Error opening file: %s\n", filename);
        return;
    }
    // Write pixel values to array
    for (y = 0; y < 240; y++) {
        for (x = 0; x < 320; x++) {
            fscanf(file, "%d", &img->array[x][y]);
        }
    }
    fclose(file);
}

/*
Print array for testing purposes
*/
void printArray(loadImg* img) {
    int x, y;
    for (y = 0; y < 240; y++) {
        for (x = 0; x < 320; x++) {
            printf("%d ", img->array[x][y]);
        }
        printf("\n");
    }
}


int main() {

    // Choose what code to run
    int state = SW_SAD_UNOPTIMIZED; 


    //ARM compiler does not like declaring a variable within a for loop so its done here
    int i, j, x, y, p; 
    int blockA[16][16]; // current block for comparison
    int blockB[16][16]; //reference block *currently static*
    int bestMatch = 1000; //Keeping track of lowest SAD
    int *motionVectorX = 0;
    int *motionVectorY = 0;

    int result; //for hw sad

    //For timing execution
    struct timespec start, end; 
    double execution_time;
    double total_time = 0.0; 
    double average_execution_time;

    // Load reference frame
    loadImg reference;
    loadImage(&reference, "reference.txt");

    //Load forward frame 
    loadImg forward;
    loadImage(&forward, "forward.txt");

    switch(state)
    {

//--------------Software SAD UNOPTIMIZED-----------------------------------------------------------------------------------------------        
        case SW_SAD_UNOPTIMIZED:

            // Load reference block
            for(y = 0; y < 16; y++){
                for(x = 0; x < 16; x++){
                    blockB[x][y] = reference.array[x][y];
                }
            }
         
 
            clock_gettime(CLOCK_MONOTONIC, &start);
            for(p=0; p < 1000; p++){
                
                    // Load 16x16 block A from forward image
                    for(y = 0; y < 16; y++){
                        for(x = 0; x < 16; x++){
                            blockA[x][y] = forward.array[x][y];
                        }
                    }
                     // Perform SAD current block
                     // in this example with only one reference block the current position is the same as the motion vector
                     bestMatch = SAD(blockA, blockB, 0, 0, 0, 0, bestMatch, *motionVectorX, *motionVectorY);
            }

            // print lowest SAD value *add motion vector here*
            printf("Best Match: %d\n", bestMatch);
            printf("Motion Vector X: %d\n", *motionVectorX);
            printf("Motion Vector Y: %d\n", *motionVectorY);

            // end and print execution time
            clock_gettime(CLOCK_MONOTONIC, &end); 
            execution_time = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
            printf("Execution Time SW UNOPTIMIZED: %f seconds\n", execution_time);
            
            break; 


//-----------Unrolled Software SAD------------------------------------------------------------------------------------------        
        case SW_SAD_UNROLLED: 

            // Load reference block
            for(y = 0; y < 16; y++){
                for(x = 0; x < 16; x++){
                    blockB[x][y] = reference.array[x][y];
                }
            } 

            // start clock
            clock_gettime(CLOCK_MONOTONIC, &start); 

            for(p = 0; p < 1000; p++){
                
                // Load 16x16 block A from forward image
                for(y = 0; y < 16; y++){
                    for(x = 0; x < 16; x++){
                        blockA[x][y] = forward.array[x][y];
                    }
                }
                // Perform SAD current block
                bestMatch = SAD_unrolled(blockA, blockB, 0, 0, 0, 0, bestMatch); 
            }

            // print lowest SAD value *add motion vector here*
            printf("Best Match: %d\n", bestMatch);

            //end clock and record execution time for 1000 runs
            clock_gettime(CLOCK_MONOTONIC, &end); 
            execution_time = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

            // end and print execution time
            average_execution_time = total_time / 1000.0; 
            printf("Execution Time SW UNROLLED: %f seconds\n", execution_time);

            break; 
    
//-----------Optimized Software SAD------------------------------------------------------------------------------------------        
        case SW_SAD_OPTIMIZED: 

            // Load reference block
            for(y = 0; y < 16; y++){
                for(x = 0; x < 16; x++){
                    blockB[x][y] = reference.array[x][y];
                }
            }

            //Average execution time of 1000 operations
            for(p = 0; p < 1000; p++){
                // start clock  
                clock_gettime(CLOCK_MONOTONIC, &start);
                
                    // Load 16x16 block A from forward image
                    for(y = 0; y < 16; y++){
                        for(x = 0; x < 16; x++){
                            blockA[x][y] = forward.array[x][y];
                        }
                    }
                // Perform SAD current block
                bestMatch = sw_SAD_optimized(blockA, blockB, 0, 0, 0, 0, bestMatch); 

                clock_gettime(CLOCK_MONOTONIC, &end); 
                execution_time = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
                total_time += execution_time;
    
            }

            printf("Sum of Absolute Differences: %d\n", bestMatch);

            // end and print execution time
            average_execution_time = total_time / 1000.0; 
            printf("Execution Time SW OPTIMIZED: %f seconds\n", average_execution_time);

            break; 


//--------------HW SAD NON-REENTRANT-------------------------------------------------------------------------------
   // Clock to keep track of execution time 

    case HW_SAD_NONREENTRANT:
    ; //needed to declare variables after
        
        uint8_t blockB_hw[16];
        uint8_t blockA_hw[16]; 

        int x; 

        clock_gettime(CLOCK_MONOTONIC, &start);
        
        for(p=0; p<1000; p++){ 
                for(y = 0; y < 16; y++){
                    for(x = 0; x < 16; x++){
                        blockA_hw[x] = forward.array[x][y];
                        blockB_hw[x] = reference.array[x][y];
                    }
                    result += hw_sad_nonreentrant(blockA_hw, blockB_hw); 
                }
        }

        printf("HW TEST RESULT: %d\n", result); 

        clock_gettime(CLOCK_MONOTONIC, &end); 
        execution_time = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
        printf("Execution Time HW NON-REENTRANT: %f seconds\n", execution_time);

        break; 


//--------------HW SAD REENTRANT-----------------------------------------------------------------------------------
    case HW_SAD_REENTRANT:
    ; // needed so I can declare variables after
        
        uint8_t blockB_rent[16];
        uint8_t blockA_rent[16];  

        uint8x16_t result_buffer = vdupq_n_u8(0); 


        clock_gettime(CLOCK_MONOTONIC, &start); 
                for(y = 0; y < 16; y++){
                    for(x = 0; x < 16; x++){
                        blockA_rent[x] = forward.array[x][y];
                        blockB_rent[x] = reference.array[x][y];
                    } 
                    hw_sad_reentrant(blockA_rent, blockB_rent, &result_buffer);
                }

        /*sum the final vector
        Adapted from: https://developer.arm.com/documentation/dui0472/m/Compiler-Features/Using-NEON-intrinsics
        */ 
        //split the 16x8 result vector into two 8x8 vectors
        uint8x8_t result_low = vget_low_u8(result_buffer);
        uint8x8_t result_high = vget_high_u8(result_buffer);

        //sum the lower and upper halves of the result vector
        uint8x8_t acc = vadd_u8(result_low, result_high);
        uint16x4_t acc1 = vpaddl_u8(acc);
        uint32x2_t acc2 = vpaddl_u16(acc1);

        //calculate the total
        uint32_t sum = vget_lane_u32(acc2, 0) + vget_lane_u32(acc2, 1); 

        result = (int)sum; 




        printf("HW TEST RESULT: %d\n", result); 

        clock_gettime(CLOCK_MONOTONIC, &end); 
        execution_time = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
        printf("Execution Time HW REENTRANT: %f seconds\n", execution_time);

        break; 

    } //end switch 
    return 0;
}
