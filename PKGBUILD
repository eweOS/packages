# Maintainer: Yao Zi <me@ziyao.cc>

pkgbase=libcap-ng
pkgname=(libcap-ng python-libcap-ng)
pkgver=0.9.6
pkgrel=1
pkgdesc='Library for programming Linux capabilities'
url='https://github.com/stevegrubb/libcap-ng'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later LGPL-2.1-or-later)
depends=(musl)
makedepends=(python swig linux-headers)
provides=(libcap-ng.so libdrop_ambient.so)
source=("https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('399040138e0ca62fa2bcabd63da9af4431a246ef7a654561a0ca3cb00010a539')

prepare() {
	cd "$pkgname-$pkgver"
	./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
	make install DESTDIR="$srcdir/tmpinstall"

	cd "$srcdir/tmpinstall"
	_pick_ python usr/lib/python*
}

check() {
	cd "$pkgname-$pkgver"

	LD_LIBRARY_PATH="$PWD/src/.libs" make check
}

package_libcap-ng() {
	mv tmpinstall/* "$pkgdir"
}

package_python-libcap-ng() {
	depends+=(python)
	pkgdesc+=' (Python bindings)'
	mv pkgs/python/* "$pkgdir"
}
