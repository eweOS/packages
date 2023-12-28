# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glibmm-gtk3
_pkgname=glibmm
pkgver=2.66.6
pkgrel=1
pkgdesc="C++ bindings for glib"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(pango glib cairomm)
makedepends=(meson mm-common libsigc++2 perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/glibmm/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('45d5fc254ab0cfd5802839942c71358afaa4a78148cbc8e5e60925e5e9139c8c')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
