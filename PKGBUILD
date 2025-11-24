# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyparsing
pkgver=3.2.5
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
sha512sums=('848f1ac8e8aac8269f15b4658dc26bc0a77ae8addb82b68db25598b1ec2041869f2bd1a68571de21e1744237351f8731a4ec979b9959497452d1be4435e7b1c5')

build() {
  cd pyparsing-$pkgver
  python -m build -nw
}

package() {
  cd pyparsing-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
