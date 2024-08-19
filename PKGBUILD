# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glibmm-gtk3
_pkgname=glibmm
pkgver=2.66.7
pkgrel=1
pkgdesc="C++ bindings for glib"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(pango glib cairomm libsigc++2)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/glibmm/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('1fa8cccc193ce0adcac358cf350007120272e73131447da28c0ad4ea12c67dc8')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
