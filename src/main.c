#include <stdio.h>
#include "my_module.h"

int main(void) {
    printf("Running the main application\n");
    int result = add(3, 5);
    printf("Result: %d\n", result);
    return 0;
}
