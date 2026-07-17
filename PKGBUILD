# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openjph
pkgver=0.30.1
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15 (or JPH or HTJ2K)'
url='https://github.com/aous72/OpenJPH'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl llvm-libs libtiff)
makedepends=(cmake linux-uapi-headers)
provides=(libopenjph.so)
source=("https://github.com/aous72/OpenJPH/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fb3ccf71af838ed2a42c6ea669308a2adaba115ae9d5862dfb1e2865b43eb5b8')

build() {
	cmake -S OpenJPH-"$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DOJPH_ENABLE_TIFF_SUPPORT=ON		\
		-DOJPH_BUILD_TESTS=ON			\
		-DOJPH_BUILD_EXECUTABLES=ON		\
		-DOJPH_BUILD_STREAM_EXPAND=OFF

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	cd OpenJPH-"$pkgver"
	_install_license_ LICENSE
}
