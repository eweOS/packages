# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.context
pkgver=6.0.1
pkgrel=1
pkgdesc="Context managers by jaraco"
url="https://github.com/jaraco/jaraco.context"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-portend')
source=("git+https://github.com/jaraco/jaraco.context.git#tag=v$pkgver")
sha512sums=('b4da2454ab82deb5edccdb7599e2f06d9e4ecb52d5ff474a36a1135d38855de89a076bbfa587c11304ea1afabd76d56a33eb78b3fb1134f7e8172404ff45f714')

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
