#include <assert.h>
#include <gmp.h>
#include <stdio.h>
#include <zlib.h>

#include <sigsegv.h>
#include <openssl/ssl.h>
#include <openssl/bio.h>

////////////////////////////////////////////////////////////////////////////////

void gmp();
void openssl();
void sigsegv();
void zlib();

////////////////////////////////////////////////////////////////////////////////

int main(void) {
  if (0) {
    gmp();
    zlib();
    openssl();
    sigsegv();
  };

  printf("Hello World!\n");


  return 0;
}

////////////////////////////////////////////////////////////////////////////////

void gmp() {
  mpz_t n;
  mpz_init(n);
}

void openssl() {
  BIO *bio_stderr;
  bio_stderr = BIO_new_fp(stderr, BIO_NOCLOSE);
  BIO_printf(bio_stderr, "Hello, World!\n");
  BIO_free_all(bio_stderr);
}

void sigsegv() {
  sigsegv_init(0);
}

void zlib() {
  (void) deflate(0, 0);
}
