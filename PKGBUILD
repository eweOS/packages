# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-gobject
pkgver=3.56.3
_commit_pycapi_compat=22811c3f0e69908894d2bd724f572b32667f2141
_commit_g_intro_tests=53e6bc978d5011f22d0a27cca49a94b19816ca7d
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
checkdepends=(python-pytest)
optdepends=('cairo: Cairo bindings')
source=("https://gitlab.gnome.org/GNOME/pygobject/-/archive/$pkgver/pygobject-$pkgver.tar.gz"
	"git+https://github.com/python/pythoncapi-compat.git#commit=$_commit_pycapi_compat"
	"git+https://gitlab.gnome.org/GNOME/gobject-introspection-tests.git#commit=$_commit_g_intro_tests")
sha256sums=('ad8b72852db4147cafed8bb4576a0ee6e5903a93b74745408f98148ac1efc344'
            'e292dd14afcecab95dab2aaf1401323b303fb9ffe130384d30997320acfa0785'
            '34475e4fcc49a59e4a000a69702c232789bd964da4f9e87d00c7b91cef803422')

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
