# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=atkmm
pkgver=2.36.3
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL MPL)
depends=(atk glibmm)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('725cf386ffd055a9644cdc75a3c98956205814f3f857427bedc34ac75552385d')

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
