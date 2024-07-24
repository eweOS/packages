# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pycparser
pkgver=2.22
pkgrel=1
pkgdesc='C parser and AST generator written in Python'
url='https://github.com/eliben/pycparser'
depends=('python')
makedepends=('python-setuptools')
arch=('any')
license=('BSD')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/eliben/pycparser/archive/release_v$pkgver.tar.gz"
  clang-cpp.patch
)
sha256sums=('b074c239ee828fcb9c97774b942f3ce51f0d2edc00809f49c3c3ef0f3baaf9c1'
            '990dba59ae479300d9d31fdc34e2b31ca0209efeb5f41e03b572f1895190d177')

prepare() {
  _patch_ pycparser-release_v$pkgver
}

build() {
  cd "$srcdir"/pycparser-release_v$pkgver
  python setup.py build
  cd pycparser
  python _build_tables.py
}

check() {
  cd "$srcdir"/pycparser-release_v$pkgver
  python -m unittest discover
}

package() {
  cd pycparser-release_v$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
