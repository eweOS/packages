# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cbindgen
pkgver=0.27.0
pkgrel=1
pkgdesc="A tool for generating C bindings to Rust code"
url="https://github.com/eqrion/cbindgen"
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('af74dd0452ace58895088048873a765fffacc3ad55eea00c0f2999cc4bcf9b5d')

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

