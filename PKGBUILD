# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glibmm-gtk3
_pkgname=glibmm
pkgver=2.66.9
pkgrel=1
pkgdesc="C++ bindings for glib"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(pango glib cairomm libsigc++2)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/glibmm/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('e12b045d145222d09b7fb6d896d0ebbc0c14f742a1a14cee739f250ab3c774b3')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
