# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openfpgaloader
pkgver=0.13.1
pkgrel=1
pkgdesc='Universal utility for programming FPGA'
url='https://trabucayre.github.io/openFPGALoader/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl llvm-libs libgpiod libftdi libhidapi zlib)
makedepends=(cmake)
# 0001: Backport, fix missing include of endian.h
#	reference: https://github.com/trabucayre/openFPGALoader/commit/6dbde4c3685ac890e06dd4b720f22ebd2bff2770
# 0002: Under review, avoid memcpy() on overlapping buffer to fix cmsisDAP JTAG
#	detection.
#	Reference: https://github.com/trabucayre/openFPGALoader/pull/565
source=("https://github.com/trabucayre/openFPGALoader/archive/refs/tags/v$pkgver.tar.gz"
	"0001-gowin-Fix-compilation-on-musl.patch"
	"0002-cmsisDAP-Avoid-memcpy-on-possibly-overlapping-buffer.patch")
sha256sums=('372f1942dec8a088bc7475f94ccf5a86264cb74e9154d8a162b8d4d26d3971e3'
            '99b0dd1ce531f0817ad0fc8d19863cde45df997719a785a6a9043090d99dd7cb'
            '0449f9452463e719be2fc08656182bf6d03661aee63a6cbc5d953d6403adecd3')

prepare() {
	_patch_ "openFPGALoader-$pkgver"
}

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
