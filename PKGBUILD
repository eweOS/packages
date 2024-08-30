# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=msgpack-c
pkgver=6.1.0
pkgrel=1
pkgdesc=' An efficient object serialization library for C'
url='https://github.com/msgpack/msgpack-c'
arch=(x86_64 aarch64 riscv64)
license=(BSL-1.0)
depends=(musl)
makedepends=(cmake)
provides=(libmsgpack-c.so)
source=("https://github.com/msgpack/msgpack-c/archive/refs/tags/c-$pkgver.tar.gz")
sha256sums=('c23c4070dbe01f46044bf70c5349f29453d655935b6dc710714c008bca0825a7')

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
