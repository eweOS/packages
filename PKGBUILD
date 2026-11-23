# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=msgpack-c
pkgver=7.0.2
pkgrel=1
pkgdesc=' An efficient object serialization library for C'
url='https://github.com/msgpack/msgpack-c'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSL-1.0)
depends=(musl)
makedepends=(cmake)
provides=(libmsgpack-c.so)
source=("https://github.com/msgpack/msgpack-c/archive/refs/tags/c-$pkgver.tar.gz")
sha256sums=('f720af974b72cda874c2c347d4bafef5385c4e7942a27b3c87d6fa482412d08c')

build () {
	cd msgpack-c-c-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_INSTALL_LIBDIR=lib	\
		-DMSGPACK_BUILD_TESTS=OFF	\
		.
}

package() {
	cd msgpack-c-c-$pkgver
	make install DESTDIR=$pkgdir
	_install_license_ LICENSE_1_0.txt
}
