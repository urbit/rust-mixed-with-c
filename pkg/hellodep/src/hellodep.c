#include <assert.h>
#include <gmp.h>
#include <stdio.h>
#include <zlib.h>

#include <sigsegv.h>
#include <openssl/ssl.h>
#include <openssl/bio.h>

int main(void) {
  gmp();
  openssl();
  sigsegv();
  zlib();

  printf("Hello World!\n");

  return 0;
}

void gmp() {
  mpz_t n;
  mpz_init(n);
}

void openssl() {
  BIO *bio_stdout;
  bio_stdout = BIO_new_fp(stdout, BIO_NOCLOSE);
  BIO_printf(bio_stdout, "hello, World!\n");
  BIO_free_all(bio_stdout);
}

void sigsegv() {
  sigsegv_init(0);
}

void zlib() {
  (void) deflate(0, 0);
}
