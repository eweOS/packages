# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pangomm
pkgver=2.54.0
pkgrel=1
pkgdesc="C++ bindings for Pango"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(pango glibmm cairomm)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/pangomm/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('0d1685e9c30536c1b67f0a430b5f4c39239901d0ab619f8fddc0feffaa9ddc48')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D build-documentation=false \
    -D maintainer-mode=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
