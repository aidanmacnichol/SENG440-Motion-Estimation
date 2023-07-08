#include <iostream>
#include <fstream>
#include <string>
#include <vector>



// DONT USE THIS IT WAS REWRITTEN IN C FOR EASIER USE
class loadImg{
    public:

    // Create a 2D vector array with size 320x240
    std::vector<std::vector<double>> array; 
    loadImg(){
        array.resize(320, std::vector<double>(240)); 
    }

    std::vector<std::vector<double>> loadImage(const std::string&filename){

        // Open file
        std::ifstream file(filename);

        // SAFE CODING :)
        if(!file.is_open()) {
            std::cout << "Error opening file: " << filename << std::endl; 
            return array; 
        }

        // Load pixels into array 
        for(int i = 0; i < 320; i++){
            for(int j = 0; j < 240; j++){
                file >> array[i][j];
            }   
        }
    file.close(); 
    return array; 
    }

    // Helper function to print out array 
    void printArray(std::vector<std::vector<double>> array){
        for(int i = 0; i < 320; i++){
            for(int j = 0; j < 240; j++){
                std::cout << array[i][j] << " "; 
            }
            std::cout << std::endl; 
        }
    }
}; 



int main(){
    loadImg forward; 
    std::vector<std::vector<double>> img1 = forward.loadImage("forward.txt"); 

    forward.printArray(img1); 

}