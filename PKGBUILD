# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-chardet
pkgver=7.6.0
pkgrel=1
arch=('any')
url="https://github.com/chardet/chardet"
license=('LGPL-2.1-or-later')
depends=('python')
pkgdesc="Python3 module for character encoding auto-detection"
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs' 'git')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-pytest-xdist' 'python-hypothesis')
source=("git+$url.git#tag=$pkgver")
sha256sums=('b15e387b1495871ca58495978f28bc6cc69a111d021f853b032b1a84527c9d9c')

build() {
  cd chardet
  python -m build --wheel --no-isolation
}

check() {
  cd chardet
  PYTHONPATH="$PWD/src" python -m pytest
}

package() {
  cd chardet
  python -m installer --destdir="$pkgdir" dist/*.whl
}

