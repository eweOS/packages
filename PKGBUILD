# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-license-expression
pkgver=30.4.4
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
sha512sums=('39fe4a92372d6c28e933b2e4031c7921ee506918528525479dbc1d941180d17833137b878addafa7c7b1a1b78689a51ea84ee74e3fea28d24ae0de39c7334b94')

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
