# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=systemc
pkgver=3.0.0
pkgrel=1
pkgdesc='Set of C++ classes and macros which provide an event-driven simulation interface for modeling and describing complex hardware systems.'
url='https://www.accellera.org/downloads/standards/systemc'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(musl)
makedepends=(cmake samurai)
provides=(libsystemc.so)
source=("https://github.com/accellera-official/systemc/archive/refs/tags/3.0.0.tar.gz")
sha256sums=('4d0ab814719cfd6b1d195dd4bcb1b9e6edc5881b9a3e44117336a691992bf779')

build () {
	# OVERRIDE_DEFAULT_STACK_SIZE may be necessary
	cmake -S systemc-$pkgver -B build -G Ninja	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DBUILD_SHARED_LIBS=ON			\
		-DENABLE_PTHREADS=ON

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ systemc-$pkgver/LICENSE
}
