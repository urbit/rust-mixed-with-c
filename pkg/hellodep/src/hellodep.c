#include <stdio.h>
#include <zlib.h>

void *hack = NULL;

int main(void) {
    printf("Hello World!\n");
    (void) deflate(hack, 0);
    return 0;
}
