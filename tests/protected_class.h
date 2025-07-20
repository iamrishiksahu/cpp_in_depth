#pragma once

#include <iostream>

namespace RKD
{
class A
{
  public:
    void call_foo();

  protected:
    void foo();
};

class B: private A
{
    public: void call_foo_dr();
};
} // namespace RKD