# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-trove-classifiers
pkgver=2024.10.14
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-calver')
checkdepends=('python-pytest')
source=("git+https://github.com/pypa/trove-classifiers.git#tag=$pkgver")
sha512sums=('cf1e3731506b5343dd50ad4f2028b00698bc352bc4a8157e6a268859a5251f73c537ec5d2caf40fbf8780fe928f148e0c0d8ea3094927d337971d171223f9dfe')

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
