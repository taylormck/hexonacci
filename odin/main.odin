package hex

import "core:fmt"
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
	fmt.println(result)
}
