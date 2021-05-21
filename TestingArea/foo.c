#include <stdlib.h>
#include <stdio.h>

typedef struct FooStruct {
    uint8_t bar_value;
} FooStruct;

typedef struct FooArray {
    struct FooStruct *foos;
    uintptr_t foo_count;
} FooArray;

void print_foo_array(struct FooArray array) {
    for (uintptr_t i = 0; i < array.foo_count; i++) {
        printf("%d\n", array.foos[i].bar_value);
    }
}

struct FooArray initialise_foo_array(void) {
    FooStruct *foos = calloc(3, sizeof(struct FooStruct));
    foos[0].bar_value = 1;
    foos[1].bar_value = 10;
    foos[2].bar_value = 100;
    FooArray arr = { foos, 3 };
    return arr;
}
