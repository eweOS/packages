# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pangomm-gtk3
_pkgname=pangomm
pkgver=2.46.3
pkgrel=1
pkgdesc="C++ bindings for Pango"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(pango glibmm-gtk3 cairomm-gtk3)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/pangomm/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('228b3c3e1d6b3fb8a720d46a047a7738b4abbf874586577bb752ba34baf72ed4')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D build-documentation=false \
    -D maintainer-mode=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
