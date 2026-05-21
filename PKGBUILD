# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmark
pkgver=0.31.2
pkgrel=2
pkgdesc='CommonMark parsing and rendering library and program in C'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/commonmark/cmark'
license=('custom:BSD2')
makedepends=(cmake python)
source=(https://github.com/commonmark/cmark/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f9bc5ca38bcb0b727f0056100fac4d743e768872e3bacec7746de28f5700d697')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMARK_STATIC=OFF
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm 644 $pkgname-$pkgver/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
