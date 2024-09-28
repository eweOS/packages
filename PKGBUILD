# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-scripttest
pkgver=1.3.0
pkgrel=1
pkgdesc="Utilities to help with testing command line scripts"
url="https://github.com/pypa/scripttest"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/scripttest/archive/$pkgver.tar.gz")
sha512sums=('038bfb1726bff85b6e3675be51db829d3519b47665266f6ae1d3c5c6f4f06e7b16742262ca1ba240544e9bd39ae96c1be0bd5e8583736f72bb04241a1bb8acf6')

build() {
  cd "$srcdir"/scripttest-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/scripttest-$pkgver
  pytest
}

package() {
  cd scripttest-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}

