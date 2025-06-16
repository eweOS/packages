# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=rust
pkgname=(rust rust-src)
pkgver=1.87.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.rust-lang.org/'
license=('MIT OR Apache-2.0')
options=(!lto)
depends=(musl llvm-libs musl-static curl libssh2 openssl)
makedepends=(rust llvm-devel libffi perl python cmake ninja)
source=(https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz
        config.toml.tpl
        0001-musl-static.patch
        0002-disable-no-default-libraries.patch
        0003-drop-latomic-for-riscv-targets.patch)
sha256sums=('149bb9fd29be592da4e87900fc68f0629a37bf6850b46339dd44434c04fd8e76'
            'd5879bb6d754707d75791c2c7fd80aeeffbac3e0ac8d79495b2cb5edb2a368b2'
            '35a15feca59b93afd27590ba91b657c0ac2ef21d9da8e3d6eb9bc7f04bad29f0'
            'f9340dde4ba5ed44b21f36de3605994fc32fbeaf24234a1036b162c1ee94b58d'
            '6d4a08f1512d065e7b131a30cecb8f8c9c801e55d6dec824b12b7024bf2c6a56')

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
  provides=(cargo rustfmt)
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
