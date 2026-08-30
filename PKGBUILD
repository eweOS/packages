# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=avrdude
pkgver=8.2
pkgrel=2
pkgdesc='A utility to program AVR microcontrollers.'
url='https://github.com/avrdudes/avrdude'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(libelf libusb libhidapi libftdi readline libserialport)
makedepends=(flex bison cmake linux-headers)
provides=(libavrdude.so)
source=("https://github.com/avrdudes/avrdude/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72fbe49d3e3ea2f48a750e7f2c16287b163a580e020f745af39d45ba68d9d6ae')

build () {
	cmake -B build -S avrdude-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_INSTALL_SYSCONFDIR=/etc		\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DBUILD_SHARED_LIBS=ON
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
}
