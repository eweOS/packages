# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmark
pkgver=0.31.1
pkgrel=1
pkgdesc='CommonMark parsing and rendering library and program in C'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/commonmark/cmark'
license=('custom:BSD2')
makedepends=(cmake python)
source=(https://github.com/commonmark/cmark/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('3da93db5469c30588cfeb283d9d62edfc6ded9eb0edc10a4f5bbfb7d722ea802')

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
