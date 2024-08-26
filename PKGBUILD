# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mallard-ducktype
pkgver=1.0.2
pkgrel=1
pkgdesc="Parser for the lightweight Ducktype syntax for Mallard"
url="http://projectmallard.org"
arch=(any)
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/projectmallard/mallard-ducktype#tag=$pkgver")
sha256sums=('ecdddde204b0d34c61b16fc54696d311db40b7fbdee9218ed3dbe1d201cc0692')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
