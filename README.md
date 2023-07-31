# SENG440 - Motion Estimation 

Project to implement the sum of absolute differences (SAD) operation within ARM hardware. 

Greyscale 320x240 images are used - one for the reference frame and another for the preceding frame called "forward" 

1. Images are converted to greyscale and the individual pixel values are written to a file in the pre-processing step.
2. Different techniques of implimenting the SAD operation are then tested and timed to measure performance improvements. 
