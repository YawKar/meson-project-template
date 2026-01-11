#include "calc.hpp"

constexpr double BASE_OFFSET = 32.0;
constexpr double FAHRENHEIT_PER_CELSIUS = 9.0 / 5.0;
constexpr double CELSIUS_PER_FAHRENHEIT = 1.0 / FAHRENHEIT_PER_CELSIUS;

auto celsius_to_fahrenheit(double celsius) -> double {
    return (celsius * FAHRENHEIT_PER_CELSIUS) + BASE_OFFSET;
}

auto fahrenheit_to_celsius(double fahrenheit) -> double {
    return (fahrenheit - BASE_OFFSET) * CELSIUS_PER_FAHRENHEIT;
}
