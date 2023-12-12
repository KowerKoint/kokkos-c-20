#include "sample.h"

#include <algorithm>
#include <ranges>

int n_int_sum() {
    return std::ranges::accmulate(std::ranges::iota_view(1, n+1));
}
