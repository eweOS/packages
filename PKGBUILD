# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-freezegun
pkgver=1.5.2
pkgrel=1
pkgdesc='Let your Python tests travel through time'
arch=('any')
url='https://github.com/spulec/freezegun'
license=('Apache-2.0')
depends=('python' 'python-dateutil')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('4bd8b39df614545bed9998bb9b46276e0640ea07dfff4eb03b1705b876118ff9')

prepare() {
  _patch_ $pkgname
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  TZ=C pytest -vvv
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ LICENSE
}
