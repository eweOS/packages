# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='python-boolean.py'
_name="${pkgname#python-}"
pkgver=5.0
pkgrel=1
pkgdesc='Implements boolean algebra in one module'
arch=('any')
url='https://github.com/bastikr/boolean.py'
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4abcff0f5cb0ced314f18e9ba2f323953939ba3a04837e32b6f3750a6128a83b')

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  pytest -vv
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
