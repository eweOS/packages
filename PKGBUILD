# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pango
pkgver=1.57.0
pkgrel=2
pkgdesc="A library for layout and rendering of text"
url="https://www.pango.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-or-later)
depends=(cairo glib fribidi harfbuzz)
makedepends=(meson gobject-introspection)
provides=(libpango-1.0.so libpangocairo-1.0.so libpangoft2-1.0.so)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1b2e2f683dfb5adec3faf17087ade8c648f10a5d3d0e17e421e0ac1a39e6740e')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D libthai=disabled \
    -D xft=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

