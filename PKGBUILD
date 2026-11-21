# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-scripttest
pkgver=3.0
pkgrel=1
pkgdesc="Utilities to help with testing command line scripts"
url="https://github.com/pypa/scripttest"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypa/scripttest/archive/$pkgver.tar.gz")
sha512sums=('99cad1e29d74595290dad3fe621d316502c53f520fa9540be0a1897ed425fd28a762fad2576ee2796a3a77211e22da362af4e68df412f8f68aa288ec793f072f')

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
  _install_license_ docs/license.rst
}

