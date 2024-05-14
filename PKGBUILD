# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-freezegun
pkgver=1.5.1
pkgrel=1
pkgdesc='Let your Python tests travel through time'
arch=('any')
url='https://github.com/spulec/freezegun'
license=('Apache')
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
sha256sums=('SKIP')

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
}
