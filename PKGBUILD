# Maintainer: Eric Long <i@hack3r.moe>

pkgname=rust-analyzer
pkgver=2025.11.24
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc='Rust compiler front-end for IDEs'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://rust-analyzer.github.io'
license=('MIT OR Apache-2.0')
depends=(musl llvm-libs rust-src)
source=("$pkgname-$_pkgver.tar.gz::https://github.com/rust-lang/rust-analyzer/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('c2f6ad8d921983e5865e909f5e1bf19c1772ed671f8a62ea0332e1f1cf106b3e')

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
