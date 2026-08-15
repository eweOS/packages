# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glibmm-gtk3
_pkgname=glibmm
pkgver=2.66.10
pkgrel=1
pkgdesc="C++ bindings for glib"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(pango glib cairomm libsigc++2)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/glibmm/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('6701e77f3241b2a712be0388fd2d6df2a0b75af671d2ff613b4808a9ade6e06d')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
