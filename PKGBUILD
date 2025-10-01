# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-gobject
pkgver=3.54.3
_commit_pycapi_compat=632d1aa0c4be6c67498d6b97630ddd7d7eb0f90a
_commit_g_intro_tests=ddd662bb9cdc29f047b239789fb7e56e68fa66bb
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
  git
  gobject-introspection
  meson
  python-cairo
  python-setuptools
)
checkdepends=(python-pytest)
optdepends=('cairo: Cairo bindings')
source=("https://gitlab.gnome.org/GNOME/pygobject/-/archive/$pkgver/pygobject-$pkgver.tar.gz"
	"git+https://github.com/python/pythoncapi-compat.git#commit=$_commit_pycapi_compat"
	"git+https://gitlab.gnome.org/GNOME/gobject-introspection-tests.git#commit=$_commit_g_intro_tests")
sha256sums=('7dff932af05c988dfcaf985f14d6664aeff27cd7c0eb2b2428f8cdb169a3d96e'
            'c485f20e20d48c9e1a65f419848d5ce2a42939d858dd7345aaedd7eb4f4d3151'
            '6ef25921088eb377e1046b770c4b784992dcd0d533adccc18bef69addd93d226')

build() {
  MESON_PACKAGE_CACHE_DIR="$srcdir" \
    ewe-meson pygobject-"$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build -t 10 --print-errorlogs
}

package_python-gobject() {
  meson install -C build --destdir "$pkgdir"
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
