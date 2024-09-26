# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.functools
pkgver=4.0.2
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
sha512sums=('1bb1008f508b48bfd5c9237801d1ca8192f674bfae4633f3cdad05f79ce21b7e478b47770724a325c5ed20339bdafa37cb45f19cbcd4bf65ae636ff007238568')

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
