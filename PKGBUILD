# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-packaging
pkgver=24.0
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bfffe6e677f3bdcaee87053caf5840396b694dfa771c37680282d70d62b6d928dae399a2da7f1a9ea2af482f1b61b353da0c6902d80ad932535995a8b21baabc')

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
