#include <cmath>
#include <iomanip>
#include <iostream>
#include <limits>
#include <random>
#include <stdint.h>
#include <string>

int main()
{
    class Parent
    {
    };

    class SingleData
    {
        char c;
        int a;

      public:
        SingleData(char cx)
        {
            this->c = cx;
        }

        SingleData(char cx, int x)
        {
            this->c = cx;
            this->a = x;
        }
        SingleData()                     = default;
        SingleData(const SingleData &sd) = delete;
        SingleData(SingleData &&sd_mv)   = default;

            SingleData& operator +(SingleData& sd)
            {
                sd.a = this->a + sd.a;
                return sd;
            }
    };

    std::cout << sizeof(Parent) << std::endl;
    std::cout << sizeof(SingleData) << std::endl;

    SingleData sd;
    SingleData sd1 = std::move(*(new SingleData()));

    std::string a = "hello";
    std::string b = std::move(a);

    std::cout << "a: [" << a << "]\n"; // a is in a valid but unspecified state
    std::cout << "b: [" << b << "]\n"; // b == "hello"

    std::string sx{"asdfasdf"};
    std::cout << sx << std::endl;

    SingleData sst{'a', 22};
    SingleData ssx{'b', 23};

    sst + ssx;



    return 0;
}