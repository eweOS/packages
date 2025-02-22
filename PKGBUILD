# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-dbusmock
pkgver=0.34.3
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
sha256sums=('91b2b18e8698f47b13c4bd5c3a7ad2e8ddf9002f4983d7e02fbd7367dd48b283')

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
