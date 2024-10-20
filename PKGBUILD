# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-license-expression
pkgver=30.3.1
pkgrel=2
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
sha512sums=('f17d360226e46cf43a20c2ce19282e482735ebdc7d76616ca9269177ab30926f487d516c909af509b5450019bb18d3be77638170837b743b8e476deba29efa14')

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
