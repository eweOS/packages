# Maintainer: Eric Long <i@hack3r.moe>

pkgname=cargo-insta
_pkgname=insta
pkgver=1.48.0
pkgrel=1
pkgdesc='Cargo plugin for snapshot testing in Rust'
url='https://github.com/mitsuhiko/insta'
depends=(musl llvm-libs cargo)
checkdepends=(git)
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "busybox-diff-compat.patch")
sha256sums=('acd7140f00155f3fe50b723296fb828dea9de68297f3e26f8a7e442bcc62fa79'
            'a800589bd10778cd49d50d5d33f24a85fcf00f83f707e1a5a4e3369f8c09979d')

prepare() {
  cd $_pkgname-$pkgver
  _patch_
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
