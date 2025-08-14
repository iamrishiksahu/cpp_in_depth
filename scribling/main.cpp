#include <iostream>
#include <memory>

class MyClass
{
    public:
        int a = 20;
};

void* operator new(std::size_t size)
{
    std::cout << "allocated\n";
    return std::malloc(size);
}

std::unique_ptr<std::string> func()
{
    std::unique_ptr<std::string> mc = std::make_unique<std::string>("asfd");
    return mc;
}

int main(int argc, char *argv[])
{
    std::cout << *(func().get());

    return 0;
}