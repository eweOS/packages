# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairomm
pkgver=1.18.1
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-or-later)
depends=(musl llvm-libs cairo libsigc++3)
makedepends=(meson mm-common)
source=("https://gitlab.freedesktop.org/cairo/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('05de03caac448b038a4319c06a2081a595634d9826e3187e83fb837ef8cd29f7')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
