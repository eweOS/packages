# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-typeguard
pkgver=4.3.0
pkgrel=1
pkgdesc="Run-time type checker for Python"
url="https://github.com/agronholm/typeguard"
license=('MIT')
arch=('any')
depends=('python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/agronholm/typeguard.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd typeguard
  python -m build -nw
}

check() {
  cd typeguard
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest --deselect tests/mypy/test_type_annotations.py
}

package() {
  cd typeguard
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
