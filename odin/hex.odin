package hex

import "core:fmt"

hex :: proc(n: int) -> int {
	// Technically, the hexonacci sequence is undefined for negative values of
	// n, but we can just return 0
	if n < 0 {
		return 0
	}

	// Initialize our values with the result of hex(0) and hex(1) = 1,
	// while hex(n < 0) is 0. This means we don't need to bounds
	// check when reading the front value.
	deque_length :: 7
	previous_values := [deque_length]int{0, 0, 0, 0, 0, 1, 1}
	back_index := deque_length - 1

	// We've hard-coded the values for 0 and 1, so just calculate from
	// 2 and up.
	for _ in 2 ..= n {
		// Get the front index
		front_index := (back_index + 1) % deque_length

		// Fetch the current front & back values
		back_value := previous_values[back_index]
		front_value := previous_values[front_index]

		// Calculate the new value based on the edges
		// hex(n) = 2 * (hex(n-1) - hex(n-7)) + hex(n-7)
		new_value := front_value + ((back_value - front_value) << 1)

		// Update the back index
		back_index = front_index

		// Push the new value onto the back
		previous_values[back_index] = new_value
	}

	// The result should now be at the back of the deque
	return previous_values[back_index]
}
