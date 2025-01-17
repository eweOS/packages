# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cbindgen
pkgver=0.28.0
pkgrel=1
pkgdesc="A tool for generating C bindings to Rust code"
url="https://github.com/eqrion/cbindgen"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MPL-2.0)
makedepends=(
  rust
  cargo
)
checkdepends=(
  cmake
  python
)
source=("https://github.com/eqrion/cbindgen/archive/v$pkgver.tar.gz")
sha256sums=('b0ed39dda089cafba583e407183e43de151d2ae9d945d74fb4870db7e4ca858e')

prepare() {
  cd cbindgen-"$pkgver"
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd cbindgen-"$pkgver"
  cargo build --release --frozen --all-targets
}

package() {
  cd cbindgen-"$pkgver"
  install -Dt "$pkgdir/usr/bin" target/release/cbindgen
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 CHANGES \
    {README,docs,internals}.md
}

