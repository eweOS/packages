# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libcpuid
pkgver=0.8.0
pkgrel=1
pkgdesc='A small C library for x86 CPU detection and feature extraction'
url='https://github.com/anrieff/libcpuid'
arch=(x86_64)
license=(BSD-2-Clause)
depends=(musl)
makedepends=(nasm)
provides=(libcpuid.so)
source=("https://github.com/anrieff/libcpuid/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5fe37d79bda121cbdf385ae3f6fa621da6a3102aa609400a718a4b8b82ed8aa')

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
