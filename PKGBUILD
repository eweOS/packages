# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.functools
pkgver=4.2.1
pkgrel=1
pkgdesc='Functools like those found in stdlib'
arch=('any')
url='https://github.com/jaraco/jaraco.functools'
license=('MIT')
depends=('python' 'python-more-itertools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-jaraco.classes')
conflicts=('python-jaraco')
replaces=('python-jaraco')
source=("git+https://github.com/jaraco/jaraco.functools#tag=v$pkgver")
sha512sums=('579b0b70ac00bab73d0a1ed19b15aab30d731abeb231d409fd67552acff3cee4cb6c843f5a0a47a79a2d547b078c35badb82ddef0613c5a5d5cfb373e0356d9c')

build() {
  cd jaraco.functools
  python -m build --wheel --no-isolation
}

check() {
  cd jaraco.functools
  python -m pytest
}

package() {
  cd jaraco.functools
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
