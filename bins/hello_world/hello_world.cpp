#include <calc/calc.hpp>
#include <greeter/greeter.hpp>
#include <iostream>

auto main() -> int {
    std::cout << greet("random dev") << '\n';
    constexpr double temp = 12.5;
    std::cout << "12.5*F == " << fahrenheit_to_celsius(temp) << "*C\n";
    std::cout << "12.5*C == " << celsius_to_fahrenheit(temp) << "*F\n";
}
