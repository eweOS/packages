# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openfpgaloader
pkgver=1.2.0
pkgrel=1
pkgdesc='Universal utility for programming FPGA'
url='https://trabucayre.github.io/openFPGALoader/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl llvm-libs libgpiod libftdi libhidapi zlib)
makedepends=(cmake)
source=("https://github.com/trabucayre/openFPGALoader/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f75e9896bd8c6310f98ecd629ed260ecaa83329c31e0f8f831b07531aa64d30a')

build() {
	cmake -S "openFPGALoader-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DENABLE_UDEV=OFF			\
		-DBUILD_STATIC=OFF			\
		-DUSE_PKGCONFIG=ON			\
		-DENABLE_REMOTEBITBANG=ON

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	_install_license_ "openFPGALoader-$pkgver"/LICENSE
}
