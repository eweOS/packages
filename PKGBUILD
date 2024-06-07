# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-gobject
pkgver=3.48.2
pkgrel=1
pkgdesc="Python bindings for GLib/GObject/GIO/GTK"
url="https://pygobject.gnome.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(
  gobject-introspection-runtime
  python
)
makedepends=(
  git
  gobject-introspection
  meson
  python-cairo
  python-setuptools
)
optdepends=('cairo: Cairo bindings')
source=("git+https://gitlab.gnome.org/GNOME/pygobject.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  ewe-meson pygobject build
  meson compile -C build
}

package_python-gobject() {
  meson install -C build --destdir "$pkgdir"
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
