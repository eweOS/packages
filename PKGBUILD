# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libcpuid
pkgver=0.7.1
pkgrel=1
pkgdesc='A small C library for x86 CPU detection and feature extraction'
url='https://github.com/anrieff/libcpuid'
arch=(x86_64)
license=(BSD-2-Clause)
depends=(musl)
makedepends=(nasm)
provides=(libcpuid.so)
source=("https://github.com/anrieff/libcpuid/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c54879ea33b68a2e752c20fb0e3cd04439a9177eab23371f709f15a45df43644')

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
