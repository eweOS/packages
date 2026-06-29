# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=atkmm
pkgver=2.36.4
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL MPL)
depends=(atk glibmm)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('a8c8bb64fd4b67c50b225d19b9ec8bc35de541b5e63fdff837d890f6b21f919f')

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
