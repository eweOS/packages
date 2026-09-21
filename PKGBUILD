# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libcpuid
pkgver=0.8.2
pkgrel=1
pkgdesc='A small C library for x86 CPU detection and feature extraction'
url='https://github.com/anrieff/libcpuid'
arch=(x86_64)
license=(BSD-2-Clause)
depends=(musl)
makedepends=(nasm)
provides=(libcpuid.so)
source=("https://github.com/anrieff/libcpuid/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f23e212e22ca22942cca87b18decdbce8a76d2b004c344a0789d0d26d14930d6')

build () {
	cd "$pkgname-$pkgver"

	autoreconf -iv
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"

	make check
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
