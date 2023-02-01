# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gdk-pixbuf
pkgver=2.42.10
pkgrel=2
pkgdesc="A library that loads image data in various formats"
url="https://wiki.gnome.org/Projects/GdkPixbuf"
arch=(x86_64 aarch64)
license=(LGPL)
depends=(glib libpng shared-mime-info libtiff libjpeg)
makedepends=(gobject-introspection meson)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  # man requires rst2man
  ewe-meson $pkgname-$pkgver build \
    -D builtin_loaders=all \
    -D gtk_doc=false \
    -D man=false \
    -D installed_tests=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
