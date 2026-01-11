#include "greeter.hpp"

#include <string>

auto greet(std::string const& name) -> std::string {
    return std::string("Hello ") + name;
}
