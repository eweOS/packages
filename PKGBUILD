# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=avrdude
pkgver=7.3
pkgrel=1
pkgdesc='A utility to program AVR microcontrollers.'
url='https://github.com/avrdudes/avrdude'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(libelf libusb libhidapi libftdi readline libserialport)
makedepends=(flex bison cmake)
provides=(libavrdude.so)
source=("https://github.com/avrdudes/avrdude/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c61ae67aacf8b8ccae5741f987ba4b0c48d6e320405520352a8eca8c6e2c457')

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
