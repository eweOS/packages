# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pangomm
pkgver=2.56.1
pkgrel=1
pkgdesc="C++ bindings for Pango"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(pango glibmm cairomm)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/pangomm/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('ea17c9b51740a9d909eb875e4ca19a08c6b167615571d69b8ba43ebded1621f8')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D build-documentation=false \
    -D maintainer-mode=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
