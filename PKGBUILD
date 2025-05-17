# Maintainer: Eric Long <i@hack3r.moe>

pkgname=cargo-insta
_pkgname=insta
pkgver=1.43.1
pkgrel=1
pkgdesc='Cargo plugin for snapshot testing in Rust'
url='https://github.com/mitsuhiko/insta'
depends=(musl llvm-libs cargo)
checkdepends=(git)
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('78754a96aa8abf4c377ed5a3785f26f2d6080e717bbef1970346da7cdbcf9eba')

prepare() {
  cd $_pkgname-$pkgver
  # Pull in https://github.com/rust-random/getrandom/pull/326
  cargo update -p getrandom --precise 0.2.15
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $_pkgname-$pkgver
  cargo build --frozen --release --all-features
}

check() {
  cd $_pkgname-$pkgver
  # workspace test checks if srcdir ends with "insta"
  cargo test --frozen --all-features -- --skip "test_get_cargo_workspace"
}

package() {
  cd $_pkgname-$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  _install_license_ LICENSE
}
