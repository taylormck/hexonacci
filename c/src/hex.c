#include "gmp.h"
#include "stdlib.h"

const int DEQUE_SIZE = 7;

void get_hex_number(mpz_t result, int n) {
    // Return early if n is invalid.
    // We return 0 instead of panicking.
    if (n < 0) {
        mpz_set_ui(result, 0);
    }

    mpz_t* nums = malloc(sizeof(mpz_t) * 7);

    // Initialize all the gmp numbers, and set everything to 0
    for (int i = 0; i < DEQUE_SIZE; i++) {
        mpz_init(nums[i]);
    }

    // Only the last two elements get set to 1
    mpz_set_ui(nums[5], 1);
    mpz_set_ui(nums[6], 1);

    // Set our back to the end of the array
    int back_index = DEQUE_SIZE - 1;
    int front_index;

    // Set up these values outside the loop for performance reasons
    mpz_t back_value, front_value, new_value;
    mpz_init(back_value);
    mpz_init(front_value);
    mpz_init(new_value);

    for (int i = 2; i <= n; i++) {
        // Set the front index, round back to 0 when needed
        front_index = (back_index + 1) % DEQUE_SIZE;

        mpz_set(back_value, nums[back_index]);
        mpz_set(front_value, nums[front_index]);

        // Calculate the new value based on the edges
        // hex(n) = 2 * (hex(n-1) - hex(n-7)) + hex(n-7)
        mpz_sub(new_value, back_value, front_value);
        mpz_mul_2exp(new_value, new_value, 1);
        mpz_add(new_value, front_value, new_value);

        // Move the back index forward
        back_index = front_index;

        // Set the back to the new value
        mpz_set(nums[back_index], new_value);
    }

    mpz_set(result, nums[back_index]);

    for (int i = 0; i < DEQUE_SIZE; i++) {
        mpz_clear(nums[i]);
    }

    mpz_clear(back_value);
    mpz_clear(front_value);
    mpz_clear(new_value);

    // End of the function
    free(nums);
}
