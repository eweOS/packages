# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libhidapi
pkgver=0.14.0
pkgrel=1
pkgdesc='A Simple cross-platform library for communicating with HID devices.'
url='https://libusb.info/hidapi'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Clause)
depends=(libudev libusb)
makedepends=(cmake)
provides=(libhidapi-hidraw.so libhidapi-libusb.so)
source=("https://github.com/libusb/hidapi/archive/refs/tags/hidapi-$pkgver.tar.gz")
sha256sums=('a5714234abe6e1f53647dd8cba7d69f65f71c558b7896ed218864ffcf405bcbd')

build () {
	cmake -B build -S hidapi-hidapi-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ hidapi-hidapi-$pkgver/LICENSE-bsd.txt
}
