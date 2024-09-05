# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrtp
pkgver=2.6.0
pkgrel=1
pkgdesc='Library for SRTP (Secure Realtime Transport Protocol)'
url='https://github.com/cisco/libsrtp'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Clause)
depends=(musl nss libpcap)
provides=(libsrtp.so)
source=("https://github.com/cisco/libsrtp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf641aa654861be10570bfc137d1441283822418e9757dc71ebb69a6cf84ea6b')

build () {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr \
		--enable-nss
	make
}

check() {
	cd "$pkgname-$pkgver"

	make runtest
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
	_install_license_ LICENSE
}
