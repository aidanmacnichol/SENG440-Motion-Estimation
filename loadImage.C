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

int main() {
    // loadImg forward;
    // loadImage(&forward, "forward.txt");
    // printArray(&forward);

    return 0;
}
