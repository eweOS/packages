# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=avrdude
pkgver=8.3
pkgrel=1
pkgdesc='A utility to program AVR microcontrollers.'
url='https://github.com/avrdudes/avrdude'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(libelf libusb libhidapi libftdi readline libserialport)
makedepends=(flex bison cmake linux-headers)
provides=(libavrdude.so)
source=("https://github.com/avrdudes/avrdude/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c6fe3606f2ef331e502fb9c1d418ba09eb9705e811efbe18259025a9787ee3d')

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
