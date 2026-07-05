# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=nng
pkgver=1.12.0
pkgrel=1
pkgdesc='Lightweight brokerless messaging library'
url='https://nng.nanomsg.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libnsl)
makedepends=(cmake)
provides=(libnng.so)
source=("https://github.com/nanomsg/nng/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50b7264bd8f0901f7ebdf3ec7c48f4e23dd689bbe7b2917d9d8fad58ffd09e5c')

build() {
	# TODO:
	#	Enable TLS: requires mbedtls, is it really necessary?
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DNNG_ENABLE_COVERAGE=OFF		\
		-DNNG_ENABLE_TLS=OFF			\
		-DNNG_TESTS=ON

	cmake --build build
}

check() {
	# Some tests seem to require the same network port, so we couldn't
	# run them in parallel.
	ctest --test-dir build -j1
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-$pkgver"/LICENSE.txt
}
