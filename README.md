# SENG440 - Motion Estimation 

Project to implement the sum of absolute differences (SAD) operation within ARM hardware. 

Greyscale 320x240 images are used - one for the reference frame and another for the preceding frame called "forward" 

Images are converted to greyscale and the individual pixel values are written to a file in the pre-processing step.
- The resulting image data is stored in forward.txt and reference.txt these are already generated from the pre-processing code.

The main file (loadImage.c) is structured as one large switch statement with 5 cases:
    1. SW_SAD_UNOPTIMIZED
    2. SW_SAD_UNROLLED
    3. SW_SAD_OPTIMIZED
    4. HW_SAD_NONREENTRANT
    5. HW_SAD_REENTRANT

The cases are selected with the "state" varaible at the start of main. The default is HW_SAD_REENTRANT but can be changed to test the other cases. 

We tested the software implimentations on the phsycial ARM920t board avaialable of telnet the steps for compiling and running it on there are as follows:
**much easier to just run it on qemu (steps below) instead of doing this**
    1. This board does not support NEON so the neon header as well as the hw implimentation switch statements have to be commented out
    2.  $ arm-linux-gcc -static -o loadImage.exe loadImage.c -lrt
    3. $ lftp user1@arm
    4. $ put reference.txt forward.txt loadImage.exe
    5. $ exit
    6. $ telnet arm 
    7. Login (user1) password: q6coHjd7P
    8. $ chmod +x loadImage.exe
    9. $ ./loadImage.exe


Since v4l architecture does not support NEON for our hardware solution an emulated v7-A board on QEMU on the uvic server is used. The steps for compiling and running it there are:
    1. $ arm-linux-gcc -mfloat-abi=softfp -mfpu=neon -static -o loadImage.exe loadImage.c -lrt
    2. $ qemu-linux loadImage.exe