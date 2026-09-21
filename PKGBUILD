# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glibmm
pkgver=2.90.0
pkgrel=1
pkgdesc="C++ bindings for glib"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(pango glib cairomm)
makedepends=(meson mm-common libsigc++3 perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/glibmm/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('8cf7e81ce01ef54f2f5c1005775999bad721cd860e5ff64ab3479cdcd8e36ebf')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

# need glib-networking
#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
