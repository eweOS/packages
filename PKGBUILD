# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libftdi
pkgver=1.5
pkgrel=1
pkgdesc='An open source library to talk to FTDI chips.'
url='https://www.intra2net.com/en/developer/libftdi'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-only)
depends=(libusb)
makedepends=(cmake linux-headers)
checkdepends=(boost boost-libs)
provides=(libftdi1.so libftdipp1.so)
source=("https://www.intra2net.com/en/developer/libftdi/download/libftdi1-$pkgver.tar.bz2")
sha256sums=('7c7091e9c86196148bd41177b4590dccb1510bfe6cea5bf7407ff194482eb049')

build () {
	cmake -B build -S libftdi1-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DLIB_SUFFIX=				\
		-DBUILD_TESTS=ON			\
		-DDOCUMENTATION=OFF			\
		-DEXAMPLES=OFF				\
		-DFTDIPP=ON				\
		-DFTDI_EEPROM=OFF
	cmake --build build
}

check() {
	ctest --test-dir build/test
}

package() {
	DESTDIR=$pkgdir cmake --install build
}
