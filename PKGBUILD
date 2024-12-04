# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-freezegun
pkgver=1.5.1
pkgrel=2
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
source=("$pkgname::git+$url#tag=$pkgver" freezegun-support-python-3.13.patch)
sha256sums=('e24b5ae5ed0b4057ca03a918b543a69568e1bfffb7db3989c10d525d32b4df64'
            '0c70576b411217fc14698544942aa119c9b53f327c2b842241bf43f03550f098')

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
}
