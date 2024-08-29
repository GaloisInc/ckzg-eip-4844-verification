#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

bool is_power_of_two(uint64_t n) {
    return (n & (n - 1)) == 0;
}

uint64_t reverse_bits(uint64_t n) {
    uint64_t result = 0;
    for (size_t i = 0; i < 64; ++i) {
        result <<= 1;
        result |= (n & 1);
        n >>= 1;
    }
    return result;
}
