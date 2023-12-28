# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=atkmm
pkgver=2.36.2
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL MPL)
depends=(atk glibmm)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('31e9c8d866bf0e308b53c2aa5f906e09ecd2fe0cb134eab85c0af39ae49bb7ca')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
