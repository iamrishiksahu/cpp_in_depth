#pragma once

#include <iostream>

class Z
{
  public:
    Z()
    {
        std::cout << "Z";
    }
};

class X : public Z
{
  public:
    X()
    {
        std::cout << "X";
    }
};

class A
{
  public:
    A()
    {
        std::cout << "A";
    }
};

class B : virtual A
{
  public:
    B()
    {
        std::cout << "B";
    }
};
class C : public X
{
  public:
    C()
    {
        std::cout << "C";

    }
};
class D : public B, virtual C
{
  public:
    D()
    {
        std::cout << "D";
    }
};

// int main(int argc, char *args[])
// {
//     D d;
// }