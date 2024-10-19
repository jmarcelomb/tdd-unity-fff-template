#include "unity.h"
#include "fff/fff.h"
#include "my_module.h"

// Set up FFF (Fake Function Framework)
DEFINE_FFF_GLOBALS;

void setUp(void) {
    // Initialization code if necessary
}

void tearDown(void) {
    // Cleanup code if necessary
}

void test_add(void) {
    TEST_ASSERT_EQUAL(5, add(2, 3));
}

FAKE_VALUE_FUNC(int, add_mock_example, int, int);

void test_add_with_mock(void) {
    add_mock_example_fake.return_val = 7;
    TEST_ASSERT_EQUAL(7, add_mock_example(2, 3));
    TEST_ASSERT_EQUAL(1, add_mock_example_fake.call_count);
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_add);
    RUN_TEST(test_add_with_mock);
    return UNITY_END();
}
