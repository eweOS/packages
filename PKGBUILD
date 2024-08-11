# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-trove-classifiers
pkgver=2024.7.2
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-calver')
checkdepends=('python-pytest')
source=("git+https://github.com/pypa/trove-classifiers.git#tag=$pkgver")
sha512sums=('c6e491d0581bb41afa9d42677ff0fa384dd700f2fedf1203b36f789d522adc2f5998ef78fd3842a126eeddc1c8ab7bd675cd1c4c45a94b260544c1623d5f1c02')

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
