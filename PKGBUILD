# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=vcs-versioning
pkgname=python-$_name
pkgver=2.6.0
pkgrel=1
pkgdesc='The blessed package to manage your versions by vcs metadata'
arch=(any)
url=https://github.com/pypa/setuptools-scm
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(git python-pytest python-pytest-timeout)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_name-v$pkgver.tar.gz)
sha256sums=('13c36b344b33c90fde9349ec279b7951bfd86c8aec51e161d6d58bdc5f9dc3a4')

build() {
  cd setuptools-scm-$_name-v$pkgver/$_name
  python -m build -wn
}

check() {
  cd setuptools-scm-$_name-v$pkgver/$_name
  PYTHONPATH=src python -m pytest
}

package() {
  cd setuptools-scm-$_name-v$pkgver/$_name
  python -m installer -d "$pkgdir" dist/*.whl
  _install_license_ LICENSE.txt
}
