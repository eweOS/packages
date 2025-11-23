# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-gobject
pkgver=3.55.0
_commit_pycapi_compat=22811c3f0e69908894d2bd724f572b32667f2141
_commit_g_intro_tests=b8d50f8c75479db3f846c877dbdec7eca26949f7
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
sha256sums=('9b853d963f37e2043313c807ef4a68ae1d9e3e45d8820fbe4d031aa8519545eb'
            'e292dd14afcecab95dab2aaf1401323b303fb9ffe130384d30997320acfa0785'
            'd87626d7fb554e67b80ddc60dc1a258b028a4b0cd943573449886fcbb18a77f6')

build() {
  MESON_PACKAGE_CACHE_DIR="$srcdir" \
    ewe-meson pygobject-"$pkgver" build
  meson compile -C build
}

check() {
  # The testsuite automatically detects existence of GTK3, if present, it will
  # try to initialize gtk, which isn't possible in build environment even with
  # help of a headless weston daemon as GTK3 always requires a seat with
  # keyboard to initialize. So tests must be run without GTK3 installed.
  meson test -C build -t 10 --print-errorlogs
}

package_python-gobject() {
  meson install -C build --destdir "$pkgdir"
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
