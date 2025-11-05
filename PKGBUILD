# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairomm
pkgver=1.19.0
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL MPL)
depends=(cairo libsigc++3)
makedepends=(meson mm-common)
options=(!emptydirs)
source=("https://gitlab.freedesktop.org/cairo/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('26c1baa456017fa2b281c2a3923ac5bd99abd8a7511c465735998f3152b0b58d')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
