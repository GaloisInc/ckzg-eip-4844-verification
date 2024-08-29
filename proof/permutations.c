#include <stdint.h>
#include <stdbool.h>

bool is_power_of_two(uint64_t n) {
    return (n & (n - 1)) == 0;
}
