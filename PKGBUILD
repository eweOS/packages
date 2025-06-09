# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-timeout
pkgver=2.4.0
pkgrel=1
pkgdesc='py.test plugin to abort hanging tests'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-timeout'
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pexpect' 'python-pytest-cov')
source=("https://github.com/pytest-dev/pytest-timeout/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b5c80a569f146e79a8dabfb093423635dee7c7c4c2a29f9a0b0f7b513c6c288c21c2cb744643453ba66032fdd150db36b3d26dc171c40aeb5fa0626082ce7f17')

build() {
  cd pytest-timeout-$pkgver
  python -m build -nw
}

check() {
  cd pytest-timeout-$pkgver

  python -m venv testenv --system-site-packages
  testenv/bin/python -m installer dist/*.whl
  testenv/bin/python -m pytest -vv
}

package() {
  cd pytest-timeout-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  _install_license_ LICENSE
}
