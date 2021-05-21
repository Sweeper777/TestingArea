#include <stdlib.h>

typedef struct FooStruct {
    uint8_t bar_value;
} FooStruct;

typedef struct FooArray {
    struct FooStruct *foos;
    uintptr_t foo_count;
} FooArray;

void print_foo_array(struct FooArray array);
struct FooArray initialise_foo_array(void);
