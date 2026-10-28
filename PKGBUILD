# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-more-itertools
_name=${pkgname#python-}
pkgver=11.2.1
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
sha256sums=('fba19865fefdcd593b9d06260e8c15293fc5287720dfbe1b6245c7f38e8e2028')

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
