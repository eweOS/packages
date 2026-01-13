# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=itstool
pkgver=2.0.7
pkgrel=3
pkgdesc="XML to PO and back again"
arch=(any)
url="http://itstool.org/"
license=(GPL3)
depends=(python libxml2)
makedepends=(git)
checkdepends=(diffutils)
# 0001: Downstream, use gnu-diff instead of busybox when running tests since
#	busybox doesn't support --ignore-matching-lines option.
# 0002: Downstream, disable tests requiring network, including
#	 - test_IT_translate_with_external_dtds
#	 - test_IT_keep_entities_1
source=("git+https://github.com/itstool/itstool#tag=$pkgver"
	0001-tests-use-gnu-diff-instead-of-diff.patch
	0002-tests-disable-networking.patch)
sha256sums=('7e782e2948e05c82eb21e528811212fc55776b4af412fab2a66447f95c8a0310'
            '0132e6e8ae5e6dbd5f767fce3a3e47df3ecafff48ad9a12e03eb5f267200b958'
            '5a34db54652ed81eda84bf17d61eed7e61f3f3551d9b6555a88551c71697f6d5')

prepare() {
  _patch_ $pkgname

  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname
  python tests/run_tests.py -v
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
