#include <stdio.h>

#include "low.h"

////////////////////////////////////////////////////////////////////////////////

int main (void) {
  printf("%u is the lowest of %u and %u\n", low(3,4), 3, 4);
  return 0;
}
