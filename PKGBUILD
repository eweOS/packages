# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pangomm
pkgver=2.56.0
pkgrel=1
pkgdesc="C++ bindings for Pango"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(pango glibmm cairomm)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/pangomm/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('066ceff20b73af271f4c6e7aaa43824f1275dc117471081b99cc8393c6c367d8')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D build-documentation=false \
    -D maintainer-mode=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
