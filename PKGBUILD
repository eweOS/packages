# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=llhttp
pkgver=9.4.2
pkgrel=1
pkgdesc='Port of http_parser to llparse'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://llhttp.org
license=(MIT)
depends=(musl)
makedepends=(cmake npm)
source=($pkgname-$pkgver.tar.gz::https://github.com/nodejs/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(600792625144dacf6202a01d93c9d5af4ebe45f5d4f8b49a3902a43f869639c0)

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
