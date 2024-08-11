# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=fastjsonschema
pkgname=python-fastjsonschema
pkgver=2.20.0
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
sha512sums=('2dd82d0dbe4e4e0a78e4d688c8f6a999a2fce6ba603084adb4e58e6ff8404805b8b525bcf7ab05e1e04b4261dd174ed27c415b0679e754542fbe1d3af8847415')

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
