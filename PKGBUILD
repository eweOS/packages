# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openfpgaloader
pkgver=1.1.1
pkgrel=1
pkgdesc='Universal utility for programming FPGA'
url='https://trabucayre.github.io/openFPGALoader/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl llvm-libs libgpiod libftdi libhidapi zlib)
makedepends=(cmake)
source=("https://github.com/trabucayre/openFPGALoader/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ca965f933c52a2a9dbb318df4d4de70fac5f095a8e64523f81036ab467a4b567')

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
