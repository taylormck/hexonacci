const std = @import("std");
const BigInt = std.math.big.int.Managed;

const DEQUE_LENGTH = 7;

pub fn hex(allocator: std.mem.Allocator, result: *BigInt, n: i32) !void {
    if (n < 0) {
        try result.set(0);
        return;
    }

    var previous_values: [DEQUE_LENGTH]BigInt = .{
        try BigInt.init(allocator),
        try BigInt.init(allocator),
        try BigInt.init(allocator),
        try BigInt.init(allocator),
        try BigInt.init(allocator),
        try BigInt.init(allocator),
        try BigInt.init(allocator),
    };

    defer for (&previous_values) |*val| {
        val.deinit();
    };

    try BigInt.set(&previous_values[DEQUE_LENGTH - 2], 1);
    try BigInt.set(&previous_values[DEQUE_LENGTH - 1], 1);

    var back_value: *BigInt = undefined;
    var front_value: *BigInt = undefined;

    var new_value = try BigInt.init(allocator);
    defer new_value.deinit();

    var back_index: usize = DEQUE_LENGTH - 1;
    var front_index: usize = undefined;

    var i: i32 = 2;
    while (i <= n) : (i += 1) {
        front_index = back_index + 1;
        if (front_index >= DEQUE_LENGTH) {
            front_index -= DEQUE_LENGTH;
        }

        back_value = &previous_values[back_index];
        front_value = &previous_values[front_index];

        try BigInt.sub(&new_value, back_value, front_value);
        try BigInt.shiftLeft(&new_value, &new_value, 1);
        try BigInt.add(front_value, front_value, &new_value);

        back_index = front_index;
    }

    try result.copy(previous_values[back_index].toConst());
}

pub fn hex_alloc(allocator: std.mem.Allocator, n: i32) !BigInt {
    var result = try BigInt.init(allocator);

    try hex(allocator, &result, n);

    return result;
}
