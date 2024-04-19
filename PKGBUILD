# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.context
pkgver=5.1.0
pkgrel=1
pkgdesc="Context managers by jaraco"
url="https://github.com/jaraco/jaraco.context"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/jaraco/jaraco.context.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd jaraco.context
  python -m build -wn
}

check() {
  cd jaraco.context
  python -m pytest
}

package() {
  cd jaraco.context
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
