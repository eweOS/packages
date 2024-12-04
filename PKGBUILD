# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-dbusmock
pkgver=0.32.2
pkgrel=1
pkgdesc="Mock D-Bus objects for tests"
url="https://github.com/martinpitt/python-dbusmock"
arch=(any)
license=(LGPL-3.0-or-later)
depends=(
  python-dbus
  python-gobject
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
source=("git+https://github.com/martinpitt/python-dbusmock#tag=$pkgver")
sha256sums=('7b012f959550cba461f6c62f84b85414727eed0312b07112329cf52efa18f2ea')

build() {
  cd $pkgname

  # Suppress local version
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver%%+*}"

  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
