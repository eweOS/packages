# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pango
pkgver=1.52.2
pkgrel=1
pkgdesc="A library for layout and rendering of text"
url="https://www.pango.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(cairo glib fribidi harfbuzz)
makedepends=(meson gobject-introspection)
provides=(libpango-1.0.so libpangocairo-1.0.so libpangoft2-1.0.so)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a104a4c4353b59aa3de7018f53f61ac0ab5a3504734adc288971979a1151100c')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D libthai=disabled \
    -D xft=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

