# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-typeguard
pkgver=4.4.1
pkgrel=1
pkgdesc="Run-time type checker for Python"
url="https://github.com/agronholm/typeguard"
license=('MIT')
arch=('any')
depends=('python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/agronholm/typeguard.git#tag=$pkgver")
sha256sums=('9af65c5a7ae71ba70acee533516428a418e74f862a07cf4e84db91071c761550')

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
