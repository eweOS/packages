# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-idna
pkgver=3.11
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("https://github.com/kjd/idna/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d74305f2cda17516e225361804721f45028c05bee9f9510f4c2f9980aaed42fecad0781f22da55416e8e6dcd9fbc8981dae829d0dae532c15153fcd0a9975570')

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

