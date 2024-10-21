# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-gobject
pkgver=3.50.0
pkgrel=1
pkgdesc="Python bindings for GLib/GObject/GIO/GTK"
url="https://pygobject.gnome.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  gobject-introspection-runtime
  python
)
makedepends=(
  gobject-introspection
  meson
  python-cairo
  python-setuptools
)
checkdepends=(python-pytest)
optdepends=('cairo: Cairo bindings')
source=("https://gitlab.gnome.org/GNOME/pygobject/-/archive/$pkgver/pygobject-$pkgver.tar.gz")
sha256sums=('7ffce2399b25e743acf868c9eacd38800ad6fb78bf7409cee2ea87c20e5cc8ce')

build() {
  ewe-meson pygobject-"$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build -t 10
}

package_python-gobject() {
  meson install -C build --destdir "$pkgdir"
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
