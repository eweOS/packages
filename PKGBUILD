# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=rust
pkgname=(rust rust-src)
pkgver=1.94.1
pkgrel=5
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.rust-lang.org/'
license=('MIT OR Apache-2.0')
options=(!lto)
depends=(musl llvm-libs llvm curl libssh2 openssl sqlite libgit2)
# Rust bootstrapping facilities check for presence of libc.a, thus musl-static
# is required during building,
#	thread 'main' (6374) panicked at src/bootstrap/src/core/sanity.rs:375:25:
#	couldn't find libc.a in musl libdir: /usr/lib
#	stack backtrace:
#	   0: __rustc::rust_begin_unwind
#	   1: core::panicking::panic_fmt
#	   2: bootstrap::core::sanity::check
#	             at ./src/bootstrap/src/core/sanity.rs:375:25
#	   3: bootstrap::Build::new
#	             at ./src/bootstrap/src/lib.rs:617:13
#	   4: bootstrap::main
#	             at ./src/bootstrap/src/bin/main.rs:129:21
#	   5: core::ops::function::FnOnce::call_once
#	             at /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/ops/function.rs:250:5
makedepends=(rust llvm-devel libffi perl python cmake ninja musl-static)
# 0001: Downstream, don't link CRT statically by default on musl targets
# 0002: Downstream, don't pass -nodefaultlibs to linkers, which prevents usage
#	of compiler-rt.
# 0003: Downstream, don't link libatomic for RISC-V targets, which is a
#	GCC-specific stuff
# 0004: Downstream, set lib as libexecdir
source=(https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz
        config.toml.tpl
        0001-musl-static.patch
        0002-disable-no-default-libraries.patch
        0003-drop-latomic-for-riscv-targets.patch
        0004-bootstrap-Change-libexec-dir.patch)  # install rust-analyzer-proc-macro-srv in /usr/lib rather than /usr/libexec
sha256sums=('4c142a625f12e3cdf716c68ae19f4f60d98ad1482627b08579b15838e95ad514'
            '9bcc8162593140ea2344a812bb53463363d1b0a194fcbbc09256eafb4a355e1c'
            'e4d1fe0eb0e1859837d577bda829b92178154dcea02b8dcc2998dc866df356e1'
            'f4ffb8f6b2b0081287bc0c7dc258bf48d061ae8f32baa6691c92d15855632f94'
            '6d4a08f1512d065e7b131a30cecb8f8c9c801e55d6dec824b12b7024bf2c6a56'
            '9488711e787dd22ebb25e310f19da7b8ce109224b762df726c2019b1df858646')

prepare() {
  _patch_ rustc-$pkgver-src
}

build() {
  sed config.toml.tpl \
    -e "s@%RUSTVER%@$pkgver@g" \
    -e "s@%RUSTTARGET%@$RUSTHOST@g" \
    > rustc-$pkgver-src/config.toml

  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export RUST_BACKTRACE=1
  export LIBGIT2_NO_VENDOR=1

  cd "$srcdir"/rustc-$pkgver-src
  DESTDIR="$srcdir"/install python ./x.py install -j "$(nproc)"

  cd "$srcdir"/install
  _pick_ rust-src usr/lib/rustlib/src
}

package_rust() {
  provides=(cargo rustfmt rustdoc)
  cp -r "$srcdir"/install/* "$pkgdir"

  rm "$pkgdir"/usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
  rm "$pkgdir"/usr/lib/rustlib/manifest-*

  install -d "$pkgdir"/usr/share/bash-completion
  install -d "$pkgdir"/usr/share/licenses/rust

  mv -t "$pkgdir"/usr/share/licenses/rust "$pkgdir"/usr/share/doc/rustc/COPYRIGHT*
}

package_rust-src() {
  pkgdesc="Source code for the Rust standard library"
  depends=(rust)

  cp -a pkgs/rust-src/* "$pkgdir"
}
