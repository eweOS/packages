# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-chardet
pkgver=5.2.0
pkgrel=1
arch=('any')
url="https://github.com/chardet/chardet"
license=('LGPL')
depends=('python')
pkgdesc="Python3 module for character encoding auto-detection"
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
checkdepends=('python-pytest')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd chardet
  python -m build --wheel --no-isolation
}

check() {
  cd chardet
  python -m pytest
}

package() {
  cd chardet
  python -m installer --destdir="$pkgdir" dist/*.whl
}

