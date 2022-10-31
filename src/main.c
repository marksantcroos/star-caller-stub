#include <stdio.h>
#include <stdlib.h>
#include "../include/astard.h"


int main(void)
{
    struct Variant const variants[3] = {
        {15, 16, ""},  // 16del
        {20, 20, "A"}, // 20_21insA
        {25, 26, "A"}, // 26>A
    };

    struct Coverage const coverage[2] = {
        {10, 22},
        {24, 27},
    };

    int const result = astard(3, variants, 2, coverage, 42, 19);

    printf("%d\n", result);

    return EXIT_SUCCESS;
}
