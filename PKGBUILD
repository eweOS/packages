# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pango
pkgver=1.56.3
pkgrel=1
pkgdesc="A library for layout and rendering of text"
url="https://www.pango.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(cairo glib fribidi harfbuzz)
makedepends=(meson gobject-introspection)
provides=(libpango-1.0.so libpangocairo-1.0.so libpangoft2-1.0.so)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7a059664dcd1c517979e2db2e71dc9a3550acf5a8cf76a1aadb6526d9d4b90f1')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D libthai=disabled \
    -D xft=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

