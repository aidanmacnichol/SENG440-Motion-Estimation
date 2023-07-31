#include <stdio.h> 
#include "arm_neon.h"

int neon_sad_block_8x8(uint8_t *__restrict block1, uint8_t *__restrict block2) {
    uint8x8_t res; 
    int sum = 0; 
    int i; 
    uint8x8_t v_block1; 
    uint8x8_t v_block2; 

    for (i = 0; i < 8; i++) {
        // Load 8 bytes of data from block1 and block2
        v_block1 = vld1_u8(&block1[i*8]);
        v_block2 = vld1_u8(&block2[i*8]);

        // Calculate the absolute differences between the two vectors element-wise

        res = vabd_u8(v_block1, v_block2);

        sum += vget_lane_u8(res, 0) + vget_lane_u8(res, 1) + vget_lane_u8(res, 2) + vget_lane_u8(res, 3) +
               vget_lane_u8(res, 4) + vget_lane_u8(res, 5) + vget_lane_u8(res, 6) + vget_lane_u8(res, 7);
    }
    return sum; 

    // Calculate the final SAD value by adding the remaining two elements

}

    