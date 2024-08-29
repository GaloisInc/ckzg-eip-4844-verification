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

uint64_t log2_pow2(uint64_t n) {
    uint64_t position = 0;
    while (n >>= 1)
        position++;
    return position;
}

uint64_t reverse_bits_limited(uint64_t n, uint64_t value) {
    size_t unused_bit_len = 64 - log2_pow2(n);
    return reverse_bits(value) >> unused_bit_len;
}
