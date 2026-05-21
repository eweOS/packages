# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cbindgen
pkgver=0.29.2
pkgrel=2
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
sha256sums=('c7d4d610482390c70e471a5682de714967e187ed2f92f2237c317a484a8c7e3a')

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

