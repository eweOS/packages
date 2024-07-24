# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-idna
pkgver=3.7
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("https://github.com/kjd/idna/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f753f37ae58fdb7b776c37757f7827c874eb13535db6427bc2a724e7ff1e28c2e3eb287a13eb97c37ee588d2c5217fe592f64ec305b122726ef5576c5317a34b')

build() {
   cd idna-$pkgver
   python -m build --no-isolation --wheel
}

check() {
   cd idna-$pkgver
   pytest
}

package() {
   cd idna-$pkgver
   python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

