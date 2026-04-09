# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrtp
pkgver=2.8.0
pkgrel=1
pkgdesc='Library for SRTP (Secure Realtime Transport Protocol)'
url='https://github.com/cisco/libsrtp'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl nss libpcap)
makedepends=(meson samurai)
provides=(libsrtp2.so)
source=("https://github.com/cisco/libsrtp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d123dcff5c56d4f1a9006f2b311ea99a85016cbf3bb24b1007885d422237db85')

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
