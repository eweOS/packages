# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-gobject
pkgver=3.48.2
pkgrel=2
pkgdesc="Python bindings for GLib/GObject/GIO/GTK"
url="https://pygobject.gnome.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('f0c26deacc96a25c01139f650a161fe90066b2cb8e807b1f5e04f7caa3ec71be')

prepare() {
  cd pygobject
  # fix compatibility with gobject-introspection 1.82.0
  # tests: adjust for g-i _GI_TEST_EXTERN macro rename
  git cherry-pick 9935e7ebbf718dae5761177d7b900e09bb13c2e0
}

build() {
  ewe-meson pygobject build
  meson compile -C build
}

# TODO: enable tests

package_python-gobject() {
  meson install -C build --destdir "$pkgdir"
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
