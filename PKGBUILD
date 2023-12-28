# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairomm-gtk3
_pkgname=cairomm
pkgver=1.14.5
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL MPL)
depends=(cairo libsigc++2)
makedepends=(meson mm-common)
options=(!emptydirs)
source=("https://gitlab.freedesktop.org/cairo/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('f2cb2d0d9cef8bc40c835e5f5ce5a51c5c383ead928a6de8bbf3216d10633d00')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
