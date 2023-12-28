# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gobject-introspection
pkgver=1.78.1
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries"
url="https://gitlab.gnome.org/GNOME/$pkgname"
arch=(x86_64 aarch64 riscv64)
license=(LGPL GPL)
makedepends=(cairo meson glib)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b6b7480c57c434c484ed169e89e5531362ec42b0e5cac5d562a25de61194850f')
  
build() {
  if [ "$CARCH" == "riscv64" ]; then
    # will stuck at 'Generating tests/generate_typelib' when building on rv64
    sed -i "s@subdir('tests')@warning('Skip tests')@g" $pkgname-$pkgver/meson.build
  fi
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
