#include "greeter.hpp"

auto greet(std::string const& name) -> std::string {
    return std::string("Hello ") + name;
}
