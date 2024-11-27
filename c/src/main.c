#include "stdio.h"
#include "stdlib.h"
#include "gmp.h"

extern void get_hex_number(mpz_t result, int n);

int main (int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: hex <number>\n");
        return 1;
    }

    int n = strtol(argv[1], NULL, 10);
    mpz_t result;
    mpz_init(result);
    get_hex_number(result, n);

    gmp_printf("%Zd\n", result);

    mpz_clear(result);

    return 0;
}
