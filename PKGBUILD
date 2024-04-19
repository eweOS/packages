# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pluggy
pkgver=1.4.0
pkgrel=1
pkgdesc="Plugin and hook calling mechanisms for python"
arch=('any')
url="https://github.com/pytest-dev/pluggy"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/pytest-dev/pluggy.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd pluggy
  python -m build --wheel --no-isolation
}

check() {
  cd pluggy
  PYTHONPATH="$PWD"/src python -m pytest
}

package() {
  cd pluggy
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
