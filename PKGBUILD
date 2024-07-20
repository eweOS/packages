# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=dbus-python
pkgname=python-dbus
pkgver=1.3.2
pkgrel=1
pkgdesc='Python bindings for D-Bus'
arch=(x86_64 aarch64 riscv64)
url='https://www.freedesktop.org/wiki/Software/dbus/'
license=(MIT)
depends=(
  dbus
  glib2
  python
)
makedepends=(
  git
  meson
  python-pyproject-metadata
  python-tomli
)
optdepends=('python-gobject: D-Bus services via PyGI')
source=("git+https://gitlab.freedesktop.org/dbus/$_pkgbase.git#tag=$_pkgbase-$pkgver")
sha256sums=('SKIP')

build() {
  ewe-meson $_pkgbase build
  meson compile -C build

  # Generate egg-info
  python "$_pkgbase/tools/generate-pkginfo.py" $pkgver PKG-INFO
}

check() {
  meson test -C build --print-errorlogs
}

package_python-dbus() {
  meson install -C build --destdir "$pkgdir"

  # Compile Python bytecode
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"

  # Install egg-info and license
  install -Dm644 -t "$pkgdir`python -c 'import site; print(site.getsitepackages()[0])'`/dbus_python.egg-info/" PKG-INFO
  install -Dm644 "$_pkgbase/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
