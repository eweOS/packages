# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-ddt
pkgver=1.7.2
pkgrel=1
pkgdesc="Data-Driven/Decorated Tests"
arch=('any')
license=('MIT')
url="https://github.com/txels/ddt"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-aiounittest' 'python-six' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/txels/ddt/archive/$pkgver.tar.gz")
sha512sums=('1f1e919d809fd721ba840786feedbfca45e5f85907feb21144ea83b298f5c2c047880d874dae2e60bb63e8d8d1445963b37125fcbe09966e4f9e7f77b2f6ec94')

build() {
  cd ddt-$pkgver
  python setup.py build
}

check() {
  cd ddt-$pkgver
  pytest
}

package() {
  cd ddt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
