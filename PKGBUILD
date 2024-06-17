# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmark
pkgver=0.31.0
pkgrel=1
pkgdesc='CommonMark parsing and rendering library and program in C'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/commonmark/cmark'
license=('custom:BSD2')
makedepends=(cmake python)
source=(https://github.com/commonmark/cmark/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('bbcb8f8c03b5af33fcfcf11a74e9499f20a9043200b8552f78a6e8ba76e04d11')

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
