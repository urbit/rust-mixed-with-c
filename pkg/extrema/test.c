#include <stdio.h>

#include "extrema.h"

////////////////////////////////////////////////////////////////////////////////

int main (void) {
  printf("%u is the minimum of %u and %u\n", minima(3,4), 3, 4);
  printf("%u is the maximum of %u and %u\n", maxima(3,4), 3, 4);
  return 0;
}
