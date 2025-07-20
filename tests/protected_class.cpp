#include "protected_class.h"

void RKD::A::foo()
{
    std::cout << "foo called" << std::endl;
}

void RKD::A::call_foo()
{
    foo();
}

void RKD::B::call_foo_dr()
{
    foo();
}