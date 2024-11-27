const std = @import("std");

pub fn hex_alloc(allocator: std.mem.Allocator, n: i32) i32 {
    _ = allocator;
    _ = n;

    return 3;
}
