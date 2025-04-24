# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-more-itertools
_name=${pkgname#python-}
pkgver=10.7.0
pkgrel=1
pkgdesc='More routines for operating on iterables, beyond itertools'
arch=('any')
url='https://github.com/more-itertools/more-itertools'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-flit-core'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('58b9d71f61c05c946764c0905b920e50ef96828cdec424473bfc6dd5789e4b6b')

build() {
  cd "$_name-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m unittest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
