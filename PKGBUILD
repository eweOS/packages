# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-timeout
pkgver=2.5.0
pkgrel=1
pkgdesc='py.test plugin to abort hanging tests'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-timeout'
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pexpect' 'python-pytest-cov')
source=("https://github.com/pytest-dev/pytest-timeout/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1cd669e5bb883ab2b96fc6526952cd4c1d186ece1ec6c5269724078a38858a0f571019f1f0ecadfa4880bb9e8284f1883bf2f325b124961ef64ce2a0988d37ee')

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
