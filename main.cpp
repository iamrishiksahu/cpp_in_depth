#include <iostream>
#include <optional>
#include <variant>
#include <print>

using mytype = std::variant<int, float, std::string>;

int a = 10;

void HandleMsg(int a)
{
    std::cout << "Handling Int " << a;
};

void HandleMsg(float a)
{
    std::cout << "Handling Flost " << a;
};

void handle(mytype v)
{
    std::visit(
        [](auto &&s) {
            using T = decltype(s);

            const int x = 10;

            //  bool tf = decltype(x) == decltype(x);

            static_assert(true, "asdf");
            
            if constexpr (std::is_same_v<T, int>)
            {
                // std::cout << "type: " << type a;
                // static_assert(std::is_same_v<decltype(s), int>, "Not a const int");

                HandleMsg(s);
            }
            else if constexpr (std::is_same_v<T, float>)
            {
                HandleMsg(s);
            }
            else
            {
            }
        },
        v);
}

int main()
{

    std::optional<int>                    a;
    std::variant<int, float, std::string> v;
    constexpr int                         gg = 10;

    v = 10;

    handle(v);

    std::println("asdfasdf");

    return 0;
}