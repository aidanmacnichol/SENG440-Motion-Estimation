#include <stdio.h> 
#include "arm_neon.h"

int hw_sad_nonreentrant(uint8_t *__restrict blockA, uint8_t *__restrict blockB) {

    //printf("wtf is happening %d\n", blockA[1]); 
    uint8x16_t result; 
    uint8x16_t v_blockA; 
    uint8x16_t v_blockB; 

    // Load 16 size 8 bit into SIMD register
    v_blockA = vld1q_u8(blockA);


    // Load 16 size 8 bit into SIMD register 2
    v_blockB = vld1q_u8(blockB); 

    // absolute difference between the two vectors
    result = vabdq_u8(v_blockA, v_blockB); 


    //split the 16x8 result vector into two 8x8 vectors
    uint8x8_t result_low = vget_low_u8(result);
    uint8x8_t result_high = vget_high_u8(result);

    //sum the lower and upper halves of the result vector
    uint8x8_t acc = vadd_u8(result_low, result_high);
    uint16x4_t acc1 = vpaddl_u8(acc);
    uint32x2_t acc2 = vpaddl_u16(acc1);

    //calculate the total
    uint32_t sum = vget_lane_u32(acc2, 0) + vget_lane_u32(acc2, 1);

    //return the total as an integer
    return (int)sum;
}
