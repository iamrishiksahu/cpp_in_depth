#include <iostream>

class MyClass {
    int value;

public:
    MyClass(int v = 0) : value(v) {}

    // Arithmetic Operators
    MyClass operator+(const MyClass& other) const { return MyClass(value + other.value); }
    MyClass operator-(const MyClass& other) const { return MyClass(value - other.value); }
    MyClass operator*(const MyClass& other) const { return MyClass(value * other.value); }
    MyClass operator/(const MyClass& other) const { return MyClass(value / other.value); }
    MyClass operator%(const MyClass& other) const { return MyClass(value % other.value); }

    // Assignment Operators
    MyClass& operator=(const MyClass& other) { value = other.value; return *this; }
    MyClass& operator+=(const MyClass& other) { value += other.value; return *this; }
    MyClass& operator-=(const MyClass& other) { value -= other.value; return *this; }
    MyClass& operator*=(const MyClass& other) { value *= other.value; return *this; }
    MyClass& operator/=(const MyClass& other) { value /= other.value; return *this; }
    MyClass& operator%=(const MyClass& other) { value %= other.value; return *this; }

    // Comparison Operators
    bool operator==(const MyClass& other) const { return value == other.value; }
    bool operator!=(const MyClass& other) const { return value != other.value; }
    bool operator<(const MyClass& other) const { return value < other.value; }
    bool operator<=(const MyClass& other) const { return value <= other.value; }
    bool operator>(const MyClass& other) const { return value > other.value; }
    bool operator>=(const MyClass& other) const { return value >= other.value; }

    // Logical Operators
    bool operator!() const { return !value; }
    bool operator&&(const MyClass& other) const { return value && other.value; }
    bool operator||(const MyClass& other) const { return value || other.value; }

    // Increment/Decrement
    MyClass& operator++() { ++value; return *this; }         // prefix ++
    MyClass operator++(int) { MyClass temp = *this; value++; return temp; } // postfix ++
    MyClass& operator--() { --value; return *this; }
    MyClass operator--(int) { MyClass temp = *this; value--; return temp; }

    // Subscript Operator (dummy)
    int& operator[](int index) { static int dummy = value; return dummy; }

    // Function Call Operator
    void operator()() const { std::cout << "Function call operator\n"; }

    // Address-of Operator
    MyClass* operator&() { return this; }

    // Dereference Operator
    int operator*() const { return value; }

    // Stream Insertion/Extraction (friend functions)
    friend std::ostream& operator<<(std::ostream& os, const MyClass& obj) {
        return os << obj.value;
    }

    friend std::istream& operator>>(std::istream& is, MyClass& obj) {
        return is >> obj.value;
    }
};