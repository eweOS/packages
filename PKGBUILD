# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=check
pkgver=0.15.2
pkgrel=3
pkgdesc='A unit testing framework for C'
url='https://github.com/libcheck/check'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL2)
depends=(musl)
makedepends=(cmake texinfo)
provides=(libcheck.so)
# 0001: Downstream, do not build static libcheck.a, or include it in CMake
#	configuration file, otherwise other CMake projects import this package
#	may fail to find libcheck.a.
source=("https://github.com/libcheck/check/archive/refs/tags/$pkgver.tar.gz"
	0001-Do-not-build-static-library.patch)
sha256sums=('998d355294bb94072f40584272cf4424571c396c631620ce463f6ea97aa67d2e'
            '0c8d767846a831e6169350aa08478c15c3dda2b518743e82979f5e84bced9d69')

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
