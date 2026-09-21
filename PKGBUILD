# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libjaylink
pkgver=0.5.0
pkgrel=1
pkgdesc='Library to access SEGGER J-Link and compatible devices'
url='https://gitlab.zapb.de/libjaylink/libjaylink'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl libusb libudev)
source=("https://gitlab.zapb.de/libjaylink/libjaylink/-/archive/$pkgver/libjaylink-$pkgver.tar.gz")
sha256sums=('235b12d161b29d813026704f335536a6a916646ea2058302e4ca45ca2cd81325')

prepare() {
	cd "$pkgname-$pkgver"

	autoreconf -fiv
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

# No check

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
