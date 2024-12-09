# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=protobuf
pkgver=29.1
pkgrel=2
pkgdesc="Google's data interchange format"
url='https://github.com/protocolbuffers/protobuf/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(abseil-cpp jsoncpp zlib-ng)
makedepends=(cmake)
checkdepends=(googletest)
provides=(libprotobuf.so libprotobuf-lite.so libprotoc.so)
source=("https://github.com/protocolbuffers/protobuf/releases/download/v$pkgver/protobuf-$pkgver.tar.gz")
sha256sums=('3d32940e975c4ad9b8ba69640e78f5527075bae33ca2890275bf26b853c0962c')

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
