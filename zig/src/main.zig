const std = @import("std");
const hex = @import("./hex.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        try std.io.getStdErr().writer().print("An integer must be provided as the first parameter.", .{});
        std.process.exit(1);
    }

    const n = std.fmt.parseInt(i32, args[1], 10) catch {
        try std.io.getStdErr().writer().print("An integer must be provided as the first parameter. Recieved: {s}", .{args[1]});
        std.process.exit(1);
    };

    const result = hex.hex_alloc(allocator, n);

    try std.io.getStdOut().writer().print("{d}\n", .{result});
}
