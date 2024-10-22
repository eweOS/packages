change-id = 129295
profile = "user"

[llvm]
link-shared = true
static-libstdcpp = false
use-libcxx = true

[build]
build = "%RUSTTARGET%"
target = ["%RUSTTARGET%"]
cargo = "/usr/bin/cargo"
rustc = "/usr/bin/rustc"
rustfmt = "/usr/bin/rustfmt"
locked-deps = true
vendor = true
tools = ["cargo", "rls", "clippy", "rustfmt", "rustdoc", "analysis", "src", "rust-demangler"]
sanitizers = false
profiler = true
# Generating docs fails with the wasm32-* targets
docs = false

[install]
prefix = "/usr"

[rust]
debuginfo-level-std = 2
channel = "stable"
description = "eweOS rust %RUSTVER%"
rpath = false
backtrace-on-ice = true
remap-debuginfo = true
jemalloc = false
musl-root = "/usr"
llvm-libunwind = "system"
# LLVM crashes when passing an object through ThinLTO twice.  This is triggered
# when using rust code in cross-language LTO if libstd was built using ThinLTO.
# http://blog.llvm.org/2019/09/closing-gap-cross-language-lto-between.html
# https://github.com/rust-lang/rust/issues/54872
codegen-units-std = 1
# musl target produces warnings
deny-warnings = false
lld = false

[target.%RUSTTARGET%]
crt-static = false
llvm-config = "/usr/bin/llvm-config"

[dist]
compression-formats = ["gz"]
