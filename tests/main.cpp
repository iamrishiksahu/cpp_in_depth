#include <iostream>
#include "classes.cpp"
#include <vector>

void ArrrayElementAccessSurprise()
{
    int arr[] = {1, 2, 3, 4, 5};

    std::cout << arr[1] << std::endl;
    std::cout << *(arr + 1) << std::endl;
    std::cout << 1 [arr] << std::endl;
    std::cout << *(1 + arr) << std::endl;
}

void Helper1(int matrix[][3])
{
    int *ptr = matrix[0];
    *(++ptr) = 79;
    ++matrix;
    matrix[0][0] = 99;
}

void ArrayIsByDefaultPassByReference()
{
    int matrix[][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

    Helper1(matrix);

    std::cout << matrix[0][0] << std::endl;
    std::cout << matrix[0][1] << std::endl;
    std::cout << matrix[1][0] << std::endl;
}


#include "protected_class.h"
int main(int argc, char *args[])
{
    // ArrayElementAccessSurprice();

    // ArrayIsByDefaultPassByReference();

    // D d;

    std::vector<int> v(1e2, 0);
    RKD::A a;
    a.call_foo();
    
    std::cout << "max size: " << v.max_size() << std::endl;

    RKD::B b;
    b.call_foo_dr();
    return 0;
}