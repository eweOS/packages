# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-license-expression
pkgver=30.4.0
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
sha512sums=('74103443d6f16e2ba1b8ea83fa48c5df1ebf86c2a67096f19b521f4d03da06f46ca6ceddd5ca9297196bd27aa7aede6f408f1709e1c9ad8b43ad3bf3cadd3063')

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
