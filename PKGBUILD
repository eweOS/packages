# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=systemc
pkgver=3.0.1
pkgrel=1
pkgdesc='Set of C++ classes and macros which provide an event-driven simulation interface for modeling and describing complex hardware systems.'
url='https://www.accellera.org/downloads/standards/systemc'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl)
makedepends=(cmake samurai)
provides=(libsystemc.so)
source=("https://github.com/accellera-official/systemc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d07765d0d2ffd6c01767880d0c6aaf53cd9487975f898c593ffffd713258fcbb')

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
