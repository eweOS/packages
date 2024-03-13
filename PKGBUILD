# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=msgpack-c
pkgver=6.0.0
pkgrel=1
pkgdesc=' An efficient object serialization library for C'
url='https://github.com/msgpack/msgpack-c'
arch=(x86_64 aarch64 riscv64)
license=(BSL-1.0)
depends=(musl)
makedepends=(cmake)
provides=(libmsgpack-c.so)
source=("https://github.com/msgpack/msgpack-c/archive/refs/tags/c-$pkgver.tar.gz")
sha256sums=('af6f3cf25edb220aa2140b09bb5bdd73ddf00938194bd94ebe5c92090cccb466')

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
