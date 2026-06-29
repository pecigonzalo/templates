const std = @import("std");

pub fn main() void {
    var seen = [_]bool{false} ** 256;

    const word = "foo";

    for (word) |char| {
        if (seen[char]) std.debug.print("Duplicate character found: {c}\n", .{char});
        seen[char] = true;
    }
}
