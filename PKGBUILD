# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pangomm
pkgver=2.50.1
pkgrel=1
pkgdesc="C++ bindings for Pango"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(pango glibmm cairomm)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/pangomm/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('8b4914abb0dad999b364c68ed4c4947903065bc7fa49b084f11357248b5f895e')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D build-documentation=false \
    -D maintainer-mode=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
