# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=atkmm-gtk3
_pkgname=atkmm
pkgver=2.28.4
pkgrel=1
pkgdesc="C++ bindings for ATK"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL MPL)
depends=(atk glibmm-gtk3)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('1cf934c82e5297d64b98fd70cea7764d4e97b7049979771f6e92be084e7702b7')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
