# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=urllib3
pkgname=python-urllib3
pkgver=1.26.19
pkgrel=1
pkgdesc="HTTP library with thread-safe connection pooling and file post support"
arch=("any")
url="https://github.com/urllib3/urllib3"
license=("MIT")
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://github.com/urllib3/urllib3/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6b72012dbd85434b2441229cbdea2a94583693f904dde349780e1290d581c8a5e10fe00a287a032ed1276349d0078b530f16a133e0f164dcea18105fa3dec79a')

prepare() {
  # remove python-mock requirement
  find $_name-$pkgver -type f -iname "*.py" -exec sed 's/import mock/from unittest import mock/; s/from mock/from unittest.mock/' -i {} +
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# FIXME: missing check dependencies

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
