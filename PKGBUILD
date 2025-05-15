# Maintainer: Eric Long <i@hack3r.moe>

pkgname=cargo-about
pkgver=0.7.1
pkgrel=1
pkgdesc="Cargo plugin to generate list of all licenses for a crate"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/EmbarkStudios/cargo-about"
license=('MIT OR Apache-2.0')
depends=(musl llvm-libs cargo)
makedepends=(rust)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5b090871bda2c2cf645de826c219b41486c36ffe0b474ad9f6ecba7e21d279a0')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target $RUSTHOST
}

build() {
  cd $pkgname-$pkgver
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-flto=auto"
  cargo build --release --frozen --features native-certs
}

check() {
  cd $pkgname-$pkgver
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-flto=auto"
  cargo test --frozen --features native-certs
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 target/release/$pkgname -t $pkgdir/usr/bin
  install -Dm 644 README.md -t $pkgdir/usr/share/doc/$pkgname
  _install_license_ LICENSE-MIT{,}
  _install_license_ LICENSE-APACHE{,}
}
