const std = @import("std");

pub fn main() void {
    std.debug.print("Hello from Zig.\n", .{});
}

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "add" {
    try std.testing.expectEqual(@as(i32, 42), add(40, 2));
}
