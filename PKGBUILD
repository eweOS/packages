# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-packaging
pkgver=24.2
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('cab6be7284c6bc2abce7a5bbdc25a40e33378576c5590dad4aef9d835a2205af81ca24af7ae3603d0e4e32f8865d87a621187dae2f86df6ac613c9886d482804')

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
