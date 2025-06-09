# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-packaging
pkgver=25.0
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fb8419f81f0f817440c0b297fc6e963832e219e7a324bf4e0321f1e131a4822f17a19f2eb033a8d4adb622ccb16db59776ec44906a0c0b34f2877b59b9558c18')

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
