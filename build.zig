const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const extras = b.dependency("extras", .{
        .target = target,
        .optimize = optimize,
    });

    const intrusive_parser = b.addModule("intrusive-parser", .{
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("intrusive_parser.zig"),
    });
    intrusive_parser.addImport("extras", extras.module("extras"));

    const test_step = b.step("test", "Run unit tests");
    _ = test_step;
}
