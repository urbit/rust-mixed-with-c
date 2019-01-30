#include <assert.h>
#include <gmp.h>
#include <stdio.h>
#include <zlib.h>

#include <sigsegv.h>

int main(void) {
  // zlib
  (void) deflate(0, 0);

  // gmp
  mpz_t n;
  mpz_init(n);

  // sigsegv
  sigsegv_init(0);

  // Hi!
  printf("Hello World!\n");

  return 0;
}
