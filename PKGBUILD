# Maintainer: Yukari Chiba <i@0x7f.cc>

_pyname=six
pkgname=python-six
pkgver=1.16.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities"
arch=('any')
url="https://pypi.python.org/pypi/$_pyname/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/s/$_pyname/$_pyname-$pkgver.tar.gz")
sha512sums=('076fe31c8f03b0b52ff44346759c7dc8317da0972403b84dfe5898179f55acdba6c78827e0f8a53ff20afe8b76432c6fe0d655a75c24259d9acbaa4d9e8015c0')

package() {
  cd $_pyname-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
