#include <iostream>
#include <fstream>
#include <string>
#include <vector>



class loadImg{
    public:

    std::vector<std::vector<double>> array; 
    loadImg(){
        array.resize(320, std::vector<double>(240)); 
    }

    std::vector<std::vector<double>> loadImage(const std::string&filename){

        std::ifstream file(filename);
        if(!file.is_open()) {
            std::cout << "Error opening file: " << filename << std::endl; 
            return array; 
        }

        for(int i = 0; i < 320; i++){
            for(int j = 0; j < 240; j++){
                if(!
                file >> array[i][j];

                // if(!(file >> array[i][j]))
                // std::cout << "Error reading pixel value" << std::endl;
                // file.close();
                // return array; 
            }   
        }
    file.close(); 
    return array; 
}
    // void printPixels() {
    //     for (int i = 0; i < 240; ++i) {
    //         for (int j = 0; j < 320; ++j) {
    //             std::cout << array[i][j] << " ";
    //         }
    //         std::cout << std::endl;
    //     }
    // }
}; 



int main(){
    loadImg forward; 
    std::vector<std::vector<double>> img1 = forward.loadImage("forward.txt"); 
    //forward.printPixels(); 

    // for(const auto& row : img1){
    //     for(int pixel : row){
    //     std::cout << pixel << " "; 
    //     }
    //     std::cout << std::endl; 
    // }

    int value = img1[7][0];
    std::cout << value << std::endl;  
}