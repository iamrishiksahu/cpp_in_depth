#include <iostream>
#include <vector>
#include <memory>

class Parent
{
  public:
    explicit Parent(int a)
    {
        std::cout << "Parent\n";
    }

  private:
    int *set_; // 8 byte /* Any pointer in cpp is 8 byte in 64 bit system */
};

class Child : public Parent
{
  public:
    Child(int a) : Parent(a) {};

  private:
    Parent *px_; // 8 byte
};

class Child_2 : public Parent
{
  public:
    Child_2(int a) : Parent(a) {};

  private:
    char    c_;  // 1 byte
    Parent *px_; // 8 byte
};

class Child_3 : public Parent
{
  public:
    Child_3(int a) : Parent(a) {};

  // private:
    std::vector<int> v_; // 24 byte
    // vector is always 8+8+8 = 24 byte in the stack regardless the size.
    // because the contents are allocated on the heap
    // only the heap memory pointer and the control block is present in the stack.
};

int run()
{
    std::cout << sizeof(Parent) << "\n";  // => 8  { 8 byte + 0 byte padding }
    std::cout << sizeof(Child) << "\n";   // => 16 { 16 byte + 0 byte padding }
    std::cout << sizeof(Child_2) << "\n"; // => 24 { 17 byte + 7 byte padding }
    std::cout << sizeof(Child_3) << "\n"; // => 32 { 32 byte + 0 byte padding }

    std::unique_ptr<int> p;
    *p = 10;


    std::unique_ptr<Child_3> c;

    /**
     * The padding is applied by the compiler for alignment
     */

    return 0;
}