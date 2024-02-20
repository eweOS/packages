# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cbindgen
pkgver=0.26.0
pkgrel=1
pkgdesc="A tool for generating C bindings to Rust code"
url="https://github.com/eqrion/cbindgen"
arch=(x86_64 aarch64 riscv64)
license=(MPL2)
makedepends=(
  cargo
  git
)
checkdepends=(
  cmake
  python
)
_commit=703b53c06f9fe2dbc0193d67626558cfa84a0f62  # tags/0.26.0
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd cbindgen
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd cbindgen
  cargo fetch --locked
}

build() {
  cd cbindgen
  cargo build --release --frozen --all-targets
}

package() {
  cd cbindgen
  install -Dt "$pkgdir/usr/bin" target/release/cbindgen
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 CHANGES \
    {README,docs,internals}.md
}

