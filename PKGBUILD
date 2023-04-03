# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gobject-introspection
pkgver=1.75.4
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries"
url="https://gitlab.gnome.org/GNOME/$pkgname"
arch=(x86_64 aarch64)
license=(LGPL GPL)
makedepends=(cairo meson glib)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5356640b5941368fe8abfa7810fd8b5e07160038a177dcf4b683efb840932b5b')
  
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
