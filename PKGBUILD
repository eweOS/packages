# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-chardet
pkgver=7.2.0
pkgrel=2
arch=('any')
url="https://github.com/chardet/chardet"
license=('LGPL-2.1-or-later')
depends=('python')
pkgdesc="Python3 module for character encoding auto-detection"
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs' 'git')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-pytest-xdist' 'python-hypothesis')
source=("git+$url.git#tag=$pkgver")
sha256sums=('3954aa68d31b45f7043331661c1a57cbb185a3f1fdf72dc2013f3d0fdad82a44')

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

