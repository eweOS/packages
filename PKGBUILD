# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=itstool
# We build from a specified commit instead of stable tags, only because applying
# the lxml patch cleanly requires it.
_commit=19f9580f27aa261ea383b395fdef7e153f3f9e6d # 2025.03.26
pkgver=2.0.7.r2.g${_commit:0:7}
pkgrel=1
pkgdesc="XML to PO and back again"
arch=(any)
url="http://itstool.org/"
license=(GPL-3.0-or-later)
depends=(python python-lxml)
makedepends=(git)
checkdepends=(diffutils)
# 0001: Downstream, use gnu-diff instead of busybox when running tests since
#	busybox doesn't support --ignore-matching-lines option.
# 0002: Downstream, disable tests requiring network, including
#	 - test_IT_translate_with_external_dtds
#	 - test_IT_keep_entities_1
# 0003: Under review, switch from the deprecated libxml2 Python binding to
#	python-lxml2. This helps eweOS disables the Python binding for libxml2.
#	https://github.com/itstool/itstool/pull/57
source=("git+https://github.com/itstool/itstool#commit=$_commit"
	0001-tests-use-gnu-diff-instead-of-diff.patch
	0002-tests-disable-networking.patch
	0003-Switch-from-libxml2-to-lxml.patch)
sha256sums=('870fffa8419c4f1113bd7f3cec3c79b97936cf3d4a52008ae5c5e6b05b76308a'
            '0132e6e8ae5e6dbd5f767fce3a3e47df3ecafff48ad9a12e03eb5f267200b958'
            '5a34db54652ed81eda84bf17d61eed7e61f3f3551d9b6555a88551c71697f6d5'
            '0e197fd52e2cb1840448b85d394c4d691e88eb453b9cbd288a28f0ed65ef3cd0')

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
