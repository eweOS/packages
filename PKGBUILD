# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=avrdude
pkgver=8.0
pkgrel=1
pkgdesc='A utility to program AVR microcontrollers.'
url='https://github.com/avrdudes/avrdude'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(libelf libusb libhidapi libftdi readline libserialport)
makedepends=(flex bison cmake linux-headers)
provides=(libavrdude.so)
source=("https://github.com/avrdudes/avrdude/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a689d70a826e2aa91538342c46c77be1987ba5feb9f7dab2606b8dae5d2a52d5')

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
