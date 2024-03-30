# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libmpack
pkgver=1.0.5
pkgrel=1
pkgdesc='a small binary serialization/RPC library that implements both the msgpack and msgpack-rpc specifications.'
url='https://github.com/libmpack/libmpack'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
makedepends=(libtool)
provides=(libmpack.so)
source=("https://github.com/libmpack/libmpack/archive/$pkgver.tar.gz")
sha256sums=('4ce91395d81ccea97d3ad4cb962f8540d166e59d3e2ddce8a22979b49f108956')

build () {
	cd libmpack-$pkgver
	mkdir -p build/release/src/.libs
	mkdir -p build/release/test/.libs
	mkdir -p build/release/test/deps/tap/.libs
	make PREFIX=/usr config=release
}

check() {
	cd libmpack-$pkgver
	make test config=release
}

package() {
	cd libmpack-$pkgver
	make install PREFIX=/usr config=release DESTDIR=${pkgdir}
}
