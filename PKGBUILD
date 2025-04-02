# Maintainer: Yukari Chiba <i@0x7f.cc>

_pyname=six
pkgname=python-six
pkgver=1.17.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities"
arch=('any')
url="https://pypi.python.org/pypi/$_pyname/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/s/$_pyname/$_pyname-$pkgver.tar.gz")
sha512sums=('fcfa58b03877ac3ac00a4f85b5fea4fecb2a010244451aa95013637a0aa21529f3dcfe25c0a07c72da46da1fa12bc0c16b6c641c40c6ab2133e5b5cbb5a71e4b')

package() {
  cd $_pyname-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
