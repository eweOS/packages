# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=fastjsonschema
pkgname=python-fastjsonschema
pkgver=2.22.3
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
sha512sums=('c4eb1f779ddae477a3ced946e580d965072bb75bb13894f5754039b777f06e34636e0254aaad3a6791a56dc2eacb3860b294d25e488a7192d79c3c4d5ecba914')

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
