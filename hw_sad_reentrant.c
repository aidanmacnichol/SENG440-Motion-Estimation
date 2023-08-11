#include <stdio.h> 
#include "arm_neon.h"

void hw_sad_reentrant(uint8_t *__restrict blockA, uint8_t *__restrict blockB, uint8x16_t *v_acc) {

    uint8x16_t v_blockA; 
    uint8x16_t v_blockB; 

    // Load 16 size 8 bit into SIMD register
    v_blockA = vld1q_u8(blockA);
    // Load 16 size 8 bit into SIMD register 2
    v_blockB = vld1q_u8(blockB); 
    // absolute difference between the two vectors + accumulate
    *v_acc = vabaq_u8(*v_acc, v_blockA, v_blockB);
}

    