# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=check
pkgver=0.15.2
pkgrel=1
pkgdesc='A unit testing framework for C'
url='https://github.com/libcheck/check'
arch=(x86_64 aarch64 riscv64)
license=(LGPL2)
depends=(musl)
makedepends=(cmake texinfo)
provides=(libcheck.so)
source=("https://github.com/libcheck/check/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('998d355294bb94072f40584272cf4424571c396c631620ce463f6ea97aa67d2e')

build () {
	cd check-$pkgver
	mkdir build
	cmake . -B build			\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_INSTALL_LIBDIR=lib
	cmake --build build
}

check() {
	cd check-$pkgver
	ctest --test-dir build
}

package() {
	cd check-$pkgver
	DESTDIR=$pkgdir cmake --install build
}
