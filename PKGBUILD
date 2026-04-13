# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openjph
pkgver=0.26.3
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15 (or JPH or HTJ2K)'
url='https://github.com/aous72/OpenJPH'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl llvm-libs)
makedepends=(cmake linux-uapi-headers)
provides=(libopenjph.so)
source=("https://github.com/aous72/OpenJPH/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('29de006da7f1e8cf0cd7c3ec424cf29103e465052c00b5a5f0ccb7e1f917bb3f')

prepare() {
	_patch_ OpenJPH-"$pkgver"
}

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
