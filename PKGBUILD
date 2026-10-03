# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrtp
pkgver=2.8.1
pkgrel=1
pkgdesc='Library for SRTP (Secure Realtime Transport Protocol)'
url='https://github.com/cisco/libsrtp'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl nss libpcap)
makedepends=(meson samurai)
provides=(libsrtp2.so)
source=("https://github.com/cisco/libsrtp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef5569220749529d778013aae1178391d972570a2b4f7288dda22effa875b07c')

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
