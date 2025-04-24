# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyparsing
pkgver=3.2.3
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
sha512sums=('c44c566d3acca1f21b667c4594790ace1d8f4be8b1abc0e7b57f42dfe1f86340a8e62e320d33bde3275b44de438f9208f14a12ece58f1c78f15f8115f478b6a2')

build() {
  cd pyparsing-$pkgver
  python -m build -nw
}

package() {
  cd pyparsing-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
