#include <gtest/gtest.h>

#include <calc/calc.hpp>

TEST(TemperatureCalcTests, celsius_to_fahrenheit) {
    EXPECT_EQ(celsius_to_fahrenheit(12.5), 54.5);
}
