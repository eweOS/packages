# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gobject-introspection
pkgver=1.76.1
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries"
url="https://gitlab.gnome.org/GNOME/$pkgname"
arch=(x86_64 aarch64)
license=(LGPL GPL)
makedepends=(cairo meson glib)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e744cb85c63ecb0f2c88f84f87db66f393fdb201233198ae9d5e6d68afe5de5c')
  
build() {
  ewe-meson $pkgname-$pkgver build \
    -D gtk_doc=false \
    -D doctool=disabled
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
 
  cd "$pkgdir"
  python -m compileall -d /usr/lib/$pkgbase usr/lib/$pkgbase
  python -O -m compileall -d /usr/lib/$pkgbase usr/lib/$pkgbase
}
