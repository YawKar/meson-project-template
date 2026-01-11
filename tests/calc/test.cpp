#include <gtest/gtest.h>

#include <calc/calc.hpp>

TEST(TemperatureCalcTests, CelsiusToFahrenheit) {
    EXPECT_EQ(celsius_to_fahrenheit(12.5), 54.5);
}
