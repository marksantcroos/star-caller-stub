
#include <stddef.h>
#include "../include/astard.h"

int astard(size_t const n_var, struct Variant const variants[n_var],
           size_t const n_cov, struct Coverage const coverage[n_cov],
           size_t const gene,
           size_t const reference)
{
    (void) variants;
    (void) coverage;
    return gene & reference & 0xffff;
}
