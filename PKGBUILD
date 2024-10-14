# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.functools
pkgver=4.1.0
pkgrel=1
pkgdesc='Functools like those found in stdlib'
arch=('any')
url='https://github.com/jaraco/jaraco.functools'
license=('MIT')
depends=('python' 'python-more-itertools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-jaraco.classes')
conflicts=('python-jaraco')
replaces=('python-jaraco')
source=("git+https://github.com/jaraco/jaraco.functools#tag=v$pkgver")
sha512sums=('a607327042760c23abc26f2213fc6c39abb6f9bbce1d58b0c8ac24c0cfda38cb954b1abdd43deb6535092e35325730d7d75b48047cc06be588f29335e93b4372')

build() {
  cd jaraco.functools
  python -m build --wheel --no-isolation
}

check() {
  cd jaraco.functools
  python -m pytest
}

package() {
  cd jaraco.functools
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
