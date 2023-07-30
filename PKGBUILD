# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gtkmm
pkgname=gtkmm3
pkgver=3.24.7
pkgrel=1
pkgdesc="C++ bindings for glib"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(gtk3 pangomm atkmm)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/$pkgbase/-/archive/$pkgver/$pkgbase-$pkgver.tar.bz2")
sha256sums=('358cf9ce77e0a5d7e37df18fc5a304eafd069d7e24423d7ca0ad011c96729a90')

build() {
  ewe-meson $pkgbase-$pkgver build \
    -D maintainer-mode=true \
    -Db uild-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
