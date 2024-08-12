# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-license-expression
pkgver=30.3.0
pkgrel=1
pkgdesc='Utility to parse, normalize and compare license expressions'
arch=('any')
url='https://github.com/nexB/license-expression'
license=('Apache-2.0')
depends=(
  'python'
  'python-boolean.py'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-xdist'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('60bdc7317e52fc43893d4b0a17e8caf3052ef43fa244e0b5d7529236b5382025c7c7daa860c0a5f94e71c130e532f80ec30b7efc8073146312142cf87e42760d')

prepare() {
  cd "$pkgname"

  # Fix file to comply with PEP-440
  sed \
    -i pyproject.toml \
    -e "s/^fallback_version =.*/fallback_version = \"$pkgver\"/"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
