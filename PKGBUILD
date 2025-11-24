# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pycparser
pkgver=2.23
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
sha256sums=('a0037c12991e11c95e9059b18aece5c1b2d41fac6dd7ea5ecf4f1e9e3f402845'
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
