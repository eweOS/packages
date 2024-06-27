# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=msgpack-c
pkgver=6.0.2
pkgrel=1
pkgdesc=' An efficient object serialization library for C'
url='https://github.com/msgpack/msgpack-c'
arch=(x86_64 aarch64 riscv64)
license=(BSL-1.0)
depends=(musl)
makedepends=(cmake)
provides=(libmsgpack-c.so)
source=("https://github.com/msgpack/msgpack-c/archive/refs/tags/c-$pkgver.tar.gz")
sha256sums=('f5b031d7b2f6639936826baeea4d3080e7db5db76838c7230089ec3d1f97e6a2')

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
