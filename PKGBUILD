# Maintainer: Eric Long <i@hack3r.moe>

pkgname=rust-analyzer
pkgver=2026.01.12
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc='Rust compiler front-end for IDEs'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://rust-analyzer.github.io'
license=('MIT OR Apache-2.0')
depends=(musl llvm-libs rust-src)
source=("$pkgname-$_pkgver.tar.gz::https://github.com/rust-lang/rust-analyzer/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('ac8a08e0d0c10ada066de76800f067554446b404a3da0afa2e176126d0f2e91e')

prepare() {
  cd $pkgname-$_pkgver
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $pkgname-$_pkgver
  CFG_RELEASE=1 cargo build --frozen --release
}

check() {
  cd $pkgname-$_pkgver
  # codegen tests require yet-to-be-packaged rustfmt
  cargo test --frozen -- --skip codegen
}

package() {
  cd $pkgname-$_pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  _install_license_ LICENSE-MIT{,}
  _install_license_ LICENSE-APACHE{,}
}
