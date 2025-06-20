# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=abseil-cpp
pkgver=20250512.1
pkgrel=1
pkgdesc='Abseil Common Libraries (C++).'
url='https://abseil.io'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl googletest)
makedepends=(cmake linux-headers)
source=("https://github.com/abseil/abseil-cpp/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9b7a064305e9fd94d124ffa6cc358592eb42b5da588fb4e07d09254aa40086db')

build () {
	cmake abseil-cpp-$pkgver -B build \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=Release		\
		-DABSL_PROPAGATE_CXX_STD=ON		\
		-DABSL_BUILD_TESTING=ON			\
		-DABSL_BUILD_TEST_HELPERS=ON		\
		-DABSL_USE_EXTERNAL_GOOGLETEST=ON	\
		-DABSL_FIND_GOOGLETEST=ON		\
		-DABSL_ENABLE_INSTALL=ON		\
		-DBUILD_SHARED_LIBS=ON
	cmake --build build
}

check() {
	ctest --test-dir build \
		-E absl_time_test		# no timezone data
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ abseil-cpp-$pkgver/LICENSE
}
