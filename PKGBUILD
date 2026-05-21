# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-packaging
pkgver=26.0
pkgrel=2
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=("python-pytest" "python-pretend" "python-tomli-w")
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9c96b3f70e483af3812a859de217e58e07cc48210cfb3b7e64fbc3118bd7c53c39e9f5f33d13f532a4e0ce4c208bed58c64ed5ea16390371f3480706d72a9011')

build() {
  cd packaging-$pkgver
  python -m build -nw
}

check() {
  cd packaging-$pkgver
  # muslinux != linux
  PYTHONPATH=src python -m pytest \
    --ignore=tests/test_tags.py \
    --deselect tests/test_manylinux.py::test_is_manylinux_compatible_old
}

package() {
  cd packaging-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
