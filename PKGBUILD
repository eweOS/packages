# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=systemc
pkgver=3.0.3
pkgrel=1
pkgdesc='Set of C++ classes and macros which provide an event-driven simulation interface for modeling and describing complex hardware systems.'
url='https://www.accellera.org/downloads/standards/systemc'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl)
makedepends=(cmake samurai)
provides=(libsystemc.so)
source=("https://github.com/accellera-official/systemc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6b4906fe564c81941b5d57c75ee9b20c44c3f4ead1cf607f38ff7beea9aacce4')

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
