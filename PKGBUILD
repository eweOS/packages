# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.context
pkgver=6.1.2
pkgrel=1
pkgdesc="Context managers by jaraco"
url="https://github.com/jaraco/jaraco.context"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-portend')
source=("git+https://github.com/jaraco/jaraco.context.git#tag=v$pkgver")
sha512sums=('558b266e3924c3c9b379b30fff0d6ac247ae08d75fca1252afbe00f6ebdac6fa47f62fd22907b242206fcbd20ac47243e69068e54c73e5a04e83a69123906b7d')

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
