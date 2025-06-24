# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=avrdude
pkgver=8.1
pkgrel=1
pkgdesc='A utility to program AVR microcontrollers.'
url='https://github.com/avrdudes/avrdude'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(libelf libusb libhidapi libftdi readline libserialport)
makedepends=(flex bison cmake linux-headers)
provides=(libavrdude.so)
source=("https://github.com/avrdudes/avrdude/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d3016edd5281ea09627c20b865e605d4f5354fe98f269ce20522a5b910ab399')

build () {
	cmake -B build -S avrdude-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DBUILD_SHARED_LIBS=ON
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
}
