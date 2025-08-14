# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-freezegun
pkgver=1.5.5
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
sha256sums=('41729f8bcc1ace03b0b4e55c295a7143836c70606c483c01e9cfe8e0205a97e6')

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
