#include "calc.hpp"

constexpr double base_offset = 32.0;
constexpr double fahrenheit_per_celsius = 9.0 / 5.0;
constexpr double celsius_per_fahrenheit = 1.0 / fahrenheit_per_celsius;

auto celsius_to_fahrenheit(double celsius) -> double {
    return (celsius * fahrenheit_per_celsius) + base_offset;
}

auto fahrenheit_to_celsius(double fahrenheit) -> double {
    return (fahrenheit - base_offset) * celsius_per_fahrenheit;
}
