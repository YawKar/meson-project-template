#include <calc.hpp>
#include <greeter.hpp>
#include <iostream>

int main() {
  std::cout << greet("random dev") << std::endl;
  std::cout << "12.5*F == " << fahrenheit_to_celsius(12.5) << "*C" << std::endl;
  std::cout << "12.5*C == " << celsius_to_fahrenheit(12.5) << "*F" << std::endl;
}
