# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrtp
pkgver=2.6.0
pkgrel=2
pkgdesc='Library for SRTP (Secure Realtime Transport Protocol)'
url='https://github.com/cisco/libsrtp'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Clause)
depends=(musl nss libpcap)
makedepends=(meson samurai)
provides=(libsrtp2.so)
source=("https://github.com/cisco/libsrtp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf641aa654861be10570bfc137d1441283822418e9757dc71ebb69a6cf84ea6b')

build () {
	ewe-meson "$pkgname-$pkgver" build \
		--buildtype release		\
		-Dcrypto-library=nss		\
		-Dcrypto-library-kdf=disabled	\
		-Ddoc=disabled

	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
	_install_license_ "$pkgname-$pkgver"/LICENSE
}
