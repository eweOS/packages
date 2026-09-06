# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=ply
pkgname=python-$_name
_commit=af80858e888c5f36979da88fcb1080de7b848967
pkgver=20221027.${_commit:0:8}
pkgrel=1
pkgdesc='Python implementation of parsing tools lex and yacc'
arch=(any)
url=https://www.dabeaz.com/ply
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/dabeaz/$_name/archive/$_commit.tar.gz)
sha256sums=(c825c41cdfdfc9588b2f12a5a1b9cb6a3120bde5d9bd19d7e1251fb6d137289d)

build() {
  cd $_name-$_commit
  python -m build -wn
}

check() {
  cd $_name-$_commit/tests
  PYTHONPATH=../src python testlex.py
  PYTHONPATH=../src python testyacc.py
}

package() {
  cd $_name-$_commit
  python -m installer -d "$pkgdir" dist/*.whl

  sed -n '4,33s/^# \?//p' src/$_name/lex.py | _install_license_ /dev/stdin
}
