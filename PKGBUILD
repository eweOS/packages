# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cbindgen
pkgver=0.29.0
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
sha256sums=('6697f449d4a15d814d991249a611af961c97e36d9344c7ced6df35c5c25b40cc')

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

