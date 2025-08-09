# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=rust
pkgname=(rust rust-src)
pkgver=1.89.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.rust-lang.org/'
license=('MIT OR Apache-2.0')
options=(!lto)
depends=(musl llvm-libs musl-static curl libssh2 openssl)
makedepends=(rust llvm-devel libffi perl python cmake ninja)
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
sha256sums=('2576f9f440dd99b0151bd28f59aa0ac6102d5c4f3ed4ef8a810c8dd05057250d'
            '97703a9e3c3277647dfc8e2081b05aa95bff0765ab44b4182d8ff0db35fd9e65'
            '6d0a6a0ed7793ea75b2f8449fd2bbafd3647c4117d681e1f4cfc219ef9280249'
            '9947368a7ea6c4f1a3dd055558b326ebcc97496cc7239ce88be23ef88f3b71a6'
            '6d4a08f1512d065e7b131a30cecb8f8c9c801e55d6dec824b12b7024bf2c6a56'
            '6eb382aa4e6bccfffecd46dac95019994e1d82e031db054407c58a5c6438442c')

prepare() {
  _patch_ rustc-$pkgver-src
}

build() {
  sed config.toml.tpl \
    -e "s@%RUSTVER%@$pkgver@g" \
    -e "s@%RUSTTARGET%@$RUSTHOST@g" \
    > rustc-$pkgver-src/config.toml

  export RUST_BACKTRACE=1

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
