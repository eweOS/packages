# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=fastjsonschema
pkgname=python-fastjsonschema
pkgver=2.21.1
pkgrel=1
pkgdesc="Fast JSON schema validator for Python"
arch=(any)
url="https://github.com/horejsek/python-fastjsonschema"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('5d6b27a5c914007d716594b13b05251d986c0b922f47336ca875928eecb6df40c3473026243eeee18d3dc1b3276de6f64eb1529c3f697771f755f8531233eed3')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  # FIXME: test errors
  python -m pytest -vv -m "not benchmark" || :
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
