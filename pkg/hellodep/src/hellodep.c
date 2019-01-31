#include <assert.h>
#include <gmp.h>
#include <stdio.h>
#include <zlib.h>

#include <ncursesw/ncurses.h>
#include <openssl/bio.h>
#include <openssl/ssl.h>
#include <sigsegv.h>
#include <curl/curl.h>

////////////////////////////////////////////////////////////////////////////////

void curl();
void gmp();
void ncurses();
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

void curl() {
  CURL *curl = curl_easy_init();
  curl_easy_cleanup(curl);
}

void gmp() {
  mpz_t n;
  mpz_init(n);
}

void ncurses() {
  initscr();                 // Start curses mode
  printw("Hello World !!!"); // Print Hello World
  refresh();                 // Print it on to the real screen
  getch();                   // Wait for user input
  endwin();                  // End curses mode
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
