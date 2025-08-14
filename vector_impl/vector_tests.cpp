#include "vector.h"
#include <iostream>
#include <vector>

int main(int argc, char *argv[])
{
    My::Vector<int> x;
    x.push_back(1);
    x.push_back(2);

    const My::Vector<int> s = x;

    std::vector<int> p;


    std::cout << s.size() << " " << s[1] << " " << s.back() << " " << *(x.begin()) << std::endl;
}