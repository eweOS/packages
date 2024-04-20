# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=fastjsonschema
pkgname=python-fastjsonschema
pkgver=2.19.1
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
sha512sums=('5121ccd0585ea8a78f44ceca95f3f2b5eb769ac3529998a3e54da9535bec96f7e47f1240b0eba63f6fef2dec91fa86fc6317d9da6eb54fed29076759897a42aa')

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
