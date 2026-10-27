# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-chardet
pkgver=7.7.0
pkgrel=1
arch=('any')
url="https://github.com/chardet/chardet"
license=('LGPL-2.1-or-later')
depends=('python')
pkgdesc="Python3 module for character encoding auto-detection"
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs' 'git')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-pytest-xdist' 'python-hypothesis')
source=("git+$url.git#tag=$pkgver")
sha256sums=('3f0a92fc838e88b816c49996a740ce5ac20b50b09c8604920f45a0c2e6f07c13')

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

