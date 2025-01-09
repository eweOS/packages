# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=protobuf
pkgver=29.3
pkgrel=1
pkgdesc="Google's data interchange format"
url='https://github.com/protocolbuffers/protobuf/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(abseil-cpp jsoncpp zlib-ng)
makedepends=(cmake)
checkdepends=(googletest)
provides=(libprotobuf.so libprotobuf-lite.so libprotoc.so)
source=("https://github.com/protocolbuffers/protobuf/releases/download/v$pkgver/protobuf-$pkgver.tar.gz")
sha256sums=('008a11cc56f9b96679b4c285fd05f46d317d685be3ab524b2a310be0fbad987e')

build () {
	cmake -B build protobuf-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DBUILD_SHARED_LIBS=ON			\
		-Dprotobuf_USE_EXTERNAL_GTEST=ON	\
		-Dprotobuf_ABSL_PROVIDER=package
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ protobuf-$pkgver/LICENSE
}
