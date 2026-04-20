# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=lib3mf
pkgver=2.5.0
pkgrel=2
pkgdesc='C++ implementation of 3D Manufacturing Format (3MF)'
url='https://3mf.io/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl llvm-libs util-linux-libs zlib-ng libzip)
makedepends=(cmake fast_float)
provides=(lib3mf.so)
source=("https://github.com/3MFConsortium/lib3mf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66772c95359d70012a3e97c3aadfb40564cc2cbcf8a5d4bc64d8144c4cb20fb2')

build() {
	# TODO: Devendor cppbase64. This library isn't actively updated, neither
	#	widely used, so this has a low priority.
	#
	#	The vendored GoogleTest is used, it's a testing-only dependency
	#	thus is kept as-is at least for now.
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DUSE_INCLUDED_ZLIB=OFF			\
		-DUSE_INCLUDED_LIBZIP=OFF		\
		-DUSE_INCLUDED_SSL=OFF			\
		-DUSE_INCLUDED_CPPBASE64=ON		\
		-DUSE_INCLUDED_FASTFLOAT=OFF		\
		-DSTRIP_BINARIES=OFF			\
		-DUSE_PLATFORM_UUID=ON			\
		-DLIB3MF_TESTS=ON

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
