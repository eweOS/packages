# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=smmap
pkgname=python-smmap
pkgver=6.0.0
_commit=de9d9c2cdd90bf38856b85270343a23d1680fceb  # refs/tags/v5.0.1
pkgrel=1
pkgdesc="A pure git implementation of a sliding window memory map manager"
arch=(any)
url="https://github.com/gitpython-developers/smmap"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("git+$url#tag=$_commit")
sha512sums=('bb52dd3a8254e8b12e604d30023137647a47ea5c1703e82d76b7b64daf267a6bb1bee0f9bf1f16178b019dcd2d973db2379a230fc04f6eea883e2c78dc779143')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  pytest -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
