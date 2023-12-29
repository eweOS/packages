# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=atkmm-gtk3
_pkgname=atkmm
pkgver=2.28.3
pkgrel=1
pkgdesc="C++ bindings for ATK"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL MPL)
depends=(atk glibmm-gtk3)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('62467188734e81086d1d0e3c5abfbc68b97402881717c0aa1c7fa9ab2267285f')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
