# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyparsing
pkgver=3.1.2
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
sha512sums=('172f0186b1748341c591c92f805f2944be309b39217d930ae32b519488813d9012cd993d15f6d6757fb280cb35a7abd77923f1f1e8a3b54a3ed3bdbb149ac56c')

build() {
  cd pyparsing-$pkgver
  python -m build -nw
}

package() {
  cd pyparsing-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
