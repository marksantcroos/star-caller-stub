#include <stddef.h>

struct Variant {
    size_t start;
    size_t end;
    char const *sequence;
};

struct Coverage {
    size_t start;
    size_t end;
};

int astard(size_t const n_var, struct Variant const variants[n_var],
           size_t const n_cov, struct Coverage const coverage[n_cov],
           size_t const gene,
           size_t const reference);
