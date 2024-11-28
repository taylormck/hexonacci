package hex

import "core:math/big"
import "core:testing"

@(test)
negative_n :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.zero(expected)

	hex(result, -1)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
zero :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.one(expected)

	hex(result, 0)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
one :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.one(expected)

	hex(result, 1)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
two :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 2)

	hex(result, 2)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
three :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 4)

	hex(result, 3)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
four :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 8)

	hex(result, 4)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
five :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 16)

	hex(result, 5)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
six :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 32)

	hex(result, 6)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
seven :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 63)

	hex(result, 7)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
eight :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 125)

	hex(result, 8)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
nine :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 248)

	hex(result, 9)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
ten :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, 492)

	hex(result, 10)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
hundred :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	big.set(expected, "290078479914610587823630044098", 10)

	hex(result, 100)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}

@(test)
thousand :: proc(t: ^testing.T) {
	result := &big.Int{}
	defer big.destroy(result)

	expected := &big.Int{}
	defer big.destroy(expected)

	expected_str :=
		"147171758521981335396301898732139493231374242575238391862" +
		"755514883492549900997266432708020349863119657832827068652" +
		"081033878813032085696334475148184230008825702145257746175" +
		"040842918212358619225544558464360320266186935462886982880" +
		"468546519503192534816808724113241668140084773444891728198" +
		"2829220688000"

	big.set(expected, expected_str, 10)

	hex(result, 1000)

	is_equal, err := big.equals(expected, result)

	if err != nil {
		testing.fail(t)
	}

	testing.expect(t, is_equal)
}
