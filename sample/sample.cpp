#include "sample.h"

#include <algorithm>
#include <ranges>

int n_int_sum(int n) {
    int sum = 0;
    for (int i : std::ranges::iota_view(1, n+1)) {
        sum += i;
    }
    return sum;
}
