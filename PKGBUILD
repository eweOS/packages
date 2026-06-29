# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=atkmm-gtk3
_pkgname=atkmm
pkgver=2.28.5
pkgrel=1
pkgdesc="C++ bindings for ATK"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL MPL)
depends=(atk glibmm-gtk3)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('98db1cdbbf6758c68237f2bbb6ecf417dce8fc084c86a052b1e82c1f520c838f')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
