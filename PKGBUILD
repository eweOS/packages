# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-gobject
pkgver=3.52.3
_commit_pycapi_compat=2d18aecd7b2f549d38a13e27b682ea4966f37bd8
_commit_g_intro_tests=33dca8ac76c4ccae76e462ce069853e7c12247c3
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
sha256sums=('d02c5d369106f44fbe06d39a05911883b9376933fc1c8a77dbb17dec354ac510'
            '7bb8155f5f38004bbc8c0819c303b60e776b48b98cb637498855e0a18287fd4f'
            '86bc0aca2f5c3a5290adb0b4056b0df40fb0d6480cdaced92fd57233e71d79e1')

build() {
  MESON_PACKAGE_CACHE_DIR="$srcdir" \
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
