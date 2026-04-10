# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=check
pkgver=0.15.2
pkgrel=4
pkgdesc='A unit testing framework for C'
url='https://github.com/libcheck/check'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl)
makedepends=(cmake texinfo)
provides=(libcheck.so)
# 0001: Downstream, do not build static libcheck.a, or include it in CMake
#	configuration file, otherwise other CMake projects import this package
#	may fail to find libcheck.a.
source=("https://github.com/libcheck/check/archive/refs/tags/$pkgver.tar.gz"
	0001-Do-not-build-static-library.patch)
sha256sums=('998d355294bb94072f40584272cf4424571c396c631620ce463f6ea97aa67d2e'
            '23bb8352789a030110aa73b50c3632cb7a12a633091cac78b5b9754cbb584eda')

prepare() {
	_patch_ check-$pkgver
}

build () {
	cd check-$pkgver
	cmake . -B build			\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_INSTALL_LIBDIR=lib
	cmake --build build
}

check() {
	cd check-$pkgver
	ctest --test-dir build -j"$JOBS"
}

package() {
	cd check-$pkgver
	DESTDIR=$pkgdir cmake --install build
}
