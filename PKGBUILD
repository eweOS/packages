# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-trove-classifiers
pkgver=2025.8.6.13
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-calver')
checkdepends=('python-pytest')
source=("git+https://github.com/pypa/trove-classifiers.git#tag=$pkgver")
sha512sums=('072482a8a3b2856a68210169e23347a7fed323debec70c11235d56d7fdd1a7f3538c8d07bebc0d0c897d0bb6ef3cae82a4aaab61e1c5b8ed692c6ae16e85bbdf')

build() {
  cd trove-classifiers
  python -m build --wheel --no-isolation
}

check() {
  cd trove-classifiers
  pytest
  PYTHONPATH="$PWD"/build/lib python -m tests.lib
}

package() {
  cd trove-classifiers
  python -m installer --destdir="$pkgdir" dist/*.whl
}
