# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-aiounittest
pkgver=1.4.3
pkgrel=1
pkgdesc="Test asyncio code more easily"
url="https://github.com/kwarunek/aiounittest"
license=('MIT')
arch=('any')
depends=('python-wrapt')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/kwarunek/aiounittest/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('398fcf071660bfc38cb68dc01bed83c6d2320a8a1b8e8ade921a7616f7fe70534203b28630532a287da98cbbefcc8b6cf8c97d5a35fe5c63e7e143f8c619c1bb')

build() {
  cd aiounittest-$pkgver
  python setup.py build
}

check() {
  cd aiounittest-$pkgver
  PYTHONPATH=. pytest
}

package() {
  cd aiounittest-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
