// a small C++ problem
#include <iostream>
#include <string>

int main() {
    std::cout << "Please enter your first name: ";
    std::string name;
    std::cin >> name;

    const std::string greeting = "Hello, " + name + "!";

    // the number of blanks surrounding the greeting
    const int pad = 1;

    // total number of rows and columns to write
    const int rows = pad * 2 + 3;
    const std::string::size_type cols = greeting.size() + pad * 2 + 2;

    // separate the output from the input
    std::cout << std::endl;

    for (int r = 0; r != rows; ++r) {
        std::string::size_type c = 0;

        while (c != cols) {
            // is it time to write the greeting?
            if (r == pad + 1 && c == pad + 1) {
                std::cout << greeting;
                c += greeting.size();
            } else {
                // are we on the border?
                if (r == 0 || r == rows - 1 || c == 0 || c == cols - 1) {
                    std::cout << "*";
                } else {
                    std::cout << " ";
                }
                ++c;
            }
        }
        std::cout << std::endl;
    }

    return 0;
}

