# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyparsing
pkgver=3.2.0
pkgrel=1
pkgdesc='General parsing module for Python'
arch=('any')
url='https://github.com/pyparsing/pyparsing/'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
optdepends=('python-railroad-diagrams: for generating Railroad Diagrams'
            'python-jinja: for generating Railroad Diagrams')
source=("https://github.com/pyparsing/pyparsing/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a75611d832cfdebf23e1bf624c37d85131b355be432a28ebc4542880564a65d6c70074b1297a47471d28b97bef66b27d76184883e552fd3c1c9b64f42cf1e3d0')

build() {
  cd pyparsing-$pkgver
  python -m build -nw
}

package() {
  cd pyparsing-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
