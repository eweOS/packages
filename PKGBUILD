# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-packaging
pkgver=26.3
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=("python-pytest" "python-pretend" "python-tomli-w" "python-hypothesis")
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7559e4f0376c775f57c362394ba276451bee0952012fc461458ee450e86fe89909166bb11c217be100b7909f0958f4ee9df4b51c3019e664186fda06a48d810d')

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
