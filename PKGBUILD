# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-sortedcontainers
pkgver=2.4.0
pkgrel=1
pkgdesc="Python Sorted Container Types: SortedList, SortedDict, and SortedSet"
arch=('any')
license=('Apache-2.0')
url="http://www.grantjenks.com/docs/sortedcontainers/"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grantjenks/python-sortedcontainers/archive/v$pkgver.tar.gz")
sha512sums=('f80185c6f95a85cc78f88f6f6cf389eb48be22cf94d5fcd84f3592873f17de37ec7f44c1627b7f02956ac4b4f74ca4febefc47d3c6232f70ee05dbb2449ad770')

prepare() {
  # Don't use tox
  sed -i '/tests_require/d' python-sortedcontainers-$pkgver/setup.py
}

build() {
  cd python-sortedcontainers-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd python-sortedcontainers-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd python-sortedcontainers-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
