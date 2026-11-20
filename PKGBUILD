# Maintainer: Eric Long <i@hack3r.moe>

pkgname=rust-analyzer
pkgver=2026.11.16
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc='Rust compiler front-end for IDEs'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://rust-analyzer.github.io'
license=('MIT OR Apache-2.0')
depends=(musl llvm-libs rust-src)
source=("$pkgname-$_pkgver.tar.gz::https://github.com/rust-lang/rust-analyzer/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('b80b65ab44e10abddb07ba46721c3a8e5d9baae4e757807982a1abfc2790a402')

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
  # require rustup
  cargo test --frozen -- --skip codegen --skip check_code_formatting
}

package() {
  cd $pkgname-$_pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  _install_license_ LICENSE-MIT{,}
  _install_license_ LICENSE-APACHE{,}
}
