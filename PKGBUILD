# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-idna
pkgver=3.10
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("https://github.com/kjd/idna/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c3ab2d49ab0b3b96d390a6ca1634d2ea3813655df767868ca72f3d4cb0bf4c6e72830579fe0b43a49dba060cd28a66b041715ff0fd63bb27ed1b6bfa66030625')

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

