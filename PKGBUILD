# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairomm
pkgver=1.14.4
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL MPL)
depends=(cairo libsigc++2)
makedepends=(meson mm-common)
options=(!emptydirs)
source=("https://gitlab.freedesktop.org/cairo/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('58e9e50c02a7d42c99c5091b85e20c993d66f42a42ed4b21673c8d82e4bd5868')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
