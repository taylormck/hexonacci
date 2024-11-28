package hex

import "core:fmt"
import "core:math/big"

DEQUE_LENGTH :: 7

hex :: proc(result: ^big.Int, n: int) {
	// Technically, the hexonacci sequence is undefined for negative values of
	// n, but we can just return 0
	if n < 0 {
		big.zero(result)
		return
	}

	previous_values := [DEQUE_LENGTH]big.Int{}

	defer for &val in previous_values {
		big.destroy(&val)
	}

	// Initialize our values with the result of hex(0) and hex(1) = 1,
	// while hex(n < 0) is 0. This means we don't need to bounds
	// check when reading the front value.
	big.one(&previous_values[DEQUE_LENGTH - 2])
	big.one(&previous_values[DEQUE_LENGTH - 1])

	back_index := DEQUE_LENGTH - 1

	// We'll need a scratch value to store our mid-work results into
	new_value := &big.Int{}
	defer big.destroy(new_value)

	// We've hard-coded the values for 0 and 1, so just calculate from
	// 2 and up.
	for _ in 2 ..= n {
		// Get the front index
		front_index := back_index + 1

		if front_index >= DEQUE_LENGTH {
			front_index -= DEQUE_LENGTH
		}

		// Fetch the current front & back values
		back_value := &previous_values[back_index]
		front_value := &previous_values[front_index]

		// Calculate the new value based on the edges
		// hex(n) = 2 * (hex(n-1) - hex(n-7)) + hex(n-7)
		big.sub(new_value, back_value, front_value)
		big.shl(new_value, new_value, 1)

		// For the final addition, we save the value directly into the new front
		// of the deque.
		big.add(front_value, front_value, new_value)

		// Update the back index
		back_index = front_index
	}

	// The result should now be at the back of the deque
	big.copy(result, &previous_values[back_index])
}

hex_alloc :: proc(n: int) -> ^big.Int {
	result := new(big.Int)
	hex(result, n)

	return result
}
