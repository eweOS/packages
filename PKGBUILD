# Maintainer: Yao Zi <me@ziyao.cc>

pkgbase=libcap-ng
pkgname=(libcap-ng python-libcap-ng)
pkgver=0.9.3
pkgrel=2
pkgdesc='Library for programming Linux capabilities'
url='https://github.com/stevegrubb/libcap-ng'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later LGPL-2.1-or-later)
depends=(musl)
makedepends=(python swig linux-headers)
provides=(libcap-ng.so libdrop_ambient.so)
source=("https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe11ebbb55904763b3532f19069f13ec319042634620180a03bd4653d301563e')

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
