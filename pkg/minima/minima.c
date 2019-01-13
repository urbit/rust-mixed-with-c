#include <stdint.h>

uint32_t minima(uint32_t x, uint32_t y) {
  return ((x <= y) ? x : y);
}
