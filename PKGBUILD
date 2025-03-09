# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-aiounittest
pkgver=1.5.0
pkgrel=1
pkgdesc="Test asyncio code more easily"
url="https://github.com/kwarunek/aiounittest"
license=('MIT')
arch=('any')
depends=('python-wrapt')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/kwarunek/aiounittest/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e17c5f939cff863de54a73c3aec3e5c80c037a53ee033ec8528665a6fe39bf004a2ce26a509c31e7bf6ba3e4abadb0ead908274147f010bbcd17b27c250f4ebf')

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
