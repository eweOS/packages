# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libcrc32c
pkgver=1.1.2
pkgrel=1
pkgdesc='CRC32C implementation with CPU-specific optimization.'
url='https://github.com/google/crc32c'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(cmake)
provides=(libcrc32c)
source=("https://github.com/google/crc32c/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ac07840513072b7fcebda6e821068aa04889018f24e10e46181068fb214d7e56')

build () {
	# TODO: check baseline
	cmake crc32c-$pkgver -B build \
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_BUILD_TYPE=Release 	\
		-DCRC32C_BUILD_TESTS=OFF	\
		-DCRC32C_BUILD_BENCHMARKS=OFF	\
		-DCRC32C_USE_GLOG=OFF		\
		-DBUILD_SHARED_LIBS=ON
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ crc32c-$pkgver/LICENSE
}
