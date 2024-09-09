# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=urllib3
pkgname=python-urllib3
pkgver=1.26.20
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
sha512sums=('63c4263c5e61adf28344e79b6c864c70e555b715a93e735aca5b6e169f041f3e4518961993c86c83dd13bcb149f7dd77b6e90140cf4aa2310c14fcaa0a52179b')

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
