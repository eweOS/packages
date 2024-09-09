# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-license-expression
pkgver=30.3.1
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
sha512sums=('76be20a9efa548f2d6e1cdc2d0a0ac3279c7165d40a7ba4df3992af5204554bd239462356859ad346b801274d9cb5f404a718cb9612b422f795fe9e29435b1d4')

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
