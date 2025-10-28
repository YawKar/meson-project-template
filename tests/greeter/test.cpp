#include <gtest/gtest.h>

#include <greeter/greeter.hpp>

TEST(GreeterTests, ActualNames) {
    EXPECT_EQ(greet("Michael"), "Hello Michael");
    EXPECT_EQ(greet("John"), "Hello John");
}

TEST(GreeterTests, EmptyName) { EXPECT_EQ(greet(""), "Hello "); }
