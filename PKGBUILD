# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-timeout
pkgver=2.3.1
pkgrel=1
pkgdesc='py.test plugin to abort hanging tests'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-timeout'
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pexpect' 'python-pytest-cov')
source=("https://github.com/pytest-dev/pytest-timeout/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4209e6ae34145f1c7920ad2d7a98e55014e93145dd062ac5aab4d5ee6ab675dbceaaf8feb4a558f8648362dab75a3e76d41fffcada9685f7147ed549b2a82a9b')

build() {
  cd pytest-timeout-$pkgver
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-timeout-$pkgver
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer -d tmp_install dist/*.whl
  #FIXME: missing dependency
  #PYTHONPATH="$PWD/tmp_install$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-timeout-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
