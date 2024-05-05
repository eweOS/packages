# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=abseil-cpp
pkgver=20240116.2
pkgrel=1
pkgdesc='Abseil Common Libraries (C++).'
url='https://abseil.io'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(musl)
makedepends=(cmake googletest)
source=("https://github.com/abseil/abseil-cpp/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('733726b8c3a6d39a4120d7e45ea8b41a434cdacde401cba500f14236c49b39dc')

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
	ctest --testdir build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ abseil-cpp-$pkgver/LICENSE
}
