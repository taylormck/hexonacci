package hex

import "core:fmt"
import "core:math/big"
import "core:os"
import "core:strconv"

main :: proc() {
	if len(os.args) != 2 {
		fmt.eprintln("You must pass an integer as an argument")
		os.exit(1)
	}

	n, ok := strconv.parse_int(os.args[1])

	if !ok {
		fmt.println("You must pass an integer as the only command line argument!")
		os.exit(1)
	}

	result := hex(n)
	defer free(result)
	defer big.destroy(result)

	result_string, to_string_err := big.int_to_string(result)
	defer delete(result_string)

	if to_string_err != nil {
		fmt.println("Error converting the result into a string: ", to_string_err)
		fmt.println("Raw data: ", result)
		os.exit(1)
	}

	fmt.println(result_string)
}
