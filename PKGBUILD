# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libhidapi
pkgver=0.15.0
pkgrel=1
pkgdesc='A Simple cross-platform library for communicating with HID devices.'
url='https://libusb.info/hidapi'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(libudev libusb)
makedepends=(cmake linux-headers)
provides=(libhidapi-hidraw.so libhidapi-libusb.so)
source=("https://github.com/libusb/hidapi/archive/refs/tags/hidapi-$pkgver.tar.gz")
sha256sums=('5d84dec684c27b97b921d2f3b73218cb773cf4ea915caee317ac8fc73cef8136')

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
