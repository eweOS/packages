# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=llhttp
pkgver=9.4.4
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://llhttp.org
license=(MIT)
depends=(musl)
makedepends=(cmake npm)
source=($pkgname-$pkgver.tar.gz::https://github.com/nodejs/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('530bbf6e9fa880e66decde9272bb3bd1045a09ba5a3f185561b21fa05f51f170')

prepare() {
  cd $pkgname-$pkgver

  # Codegen
  npm install
  make RELEASE=$pkgver release
}

build() {
  cmake -S $pkgname-$pkgver/release -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd $pkgname-$pkgver
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  _install_license_ LICENSE
}
