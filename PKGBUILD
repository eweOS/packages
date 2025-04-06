# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=protobuf
pkgver=30.2
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
sha256sums=('fb06709acc393cc36f87c251bb28a5500a2e12936d4346099f2c6240f6c7a941')

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
