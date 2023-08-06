#include <stdio.h> 
#include "arm_neon.h"

int neon_sad_block_8x8(uint8_t *__restrict block1, uint8_t *__restrict block2) {
    uint8x16_t res1, res2, res3, res4; 
    int sum = 0; 
    int i; 
    uint8x16_t v_block1; 
    uint8x16_t v_block2; 

    for (i = 0; i < 4; i++) {
        // Load 16 bytes of data from block1 and block2
        v_block1 = vld1q_u8(&block1[i * 16]);
        v_block2 = vld1q_u8(&block2[i * 16]);

        // Calculate the absolute differences between the two vectors element-wise
        res1 = vabdq_u8(v_block1, v_block2);
        res2 = vabdq_u8(v_block1, v_block2);
        res3 = vabdq_u8(v_block1, v_block2);
        res4 = vabdq_u8(v_block1, v_block2);

        // Sum the absolute differences of each element within the vectors
        uint8x16_t sum_vec = vaddq_u8(vaddq_u8(res1, res2), vaddq_u8(res3, res4));
        uint8x8_t sum_vec_low = vget_low_u8(sum_vec);
        uint8x8_t sum_vec_high = vget_high_u8(sum_vec);

        // Accumulate the sum for each element
        sum += vget_lane_u8(sum_vec_low, 0) + vget_lane_u8(sum_vec_low, 1) + vget_lane_u8(sum_vec_low, 2) + vget_lane_u8(sum_vec_low, 3) +
               vget_lane_u8(sum_vec_low, 4) + vget_lane_u8(sum_vec_low, 5) + vget_lane_u8(sum_vec_low, 6) + vget_lane_u8(sum_vec_low, 7) +
               vget_lane_u8(sum_vec_high, 0) + vget_lane_u8(sum_vec_high, 1) + vget_lane_u8(sum_vec_high, 2) + vget_lane_u8(sum_vec_high, 3) +
               vget_lane_u8(sum_vec_high, 4) + vget_lane_u8(sum_vec_high, 5) + vget_lane_u8(sum_vec_high, 6) + vget_lane_u8(sum_vec_high, 7);
    }
    return sum; 

    // Calculate the final SAD value by adding the remaining two elements

}

    