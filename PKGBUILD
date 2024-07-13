# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libnfs
pkgver=5.0.3
pkgrel=1
pkgdesc='NFS client library.'
url='https://github.com/sahlberg/libnfs'
arch=(x86_64 aarch64 riscv64)
license=(BSD-2-Clause LGPL-2.1-or-later GPL-3.0-or-later)
depends=(musl)
provides=(libnfs.so)
source=("https://github.com/sahlberg/libnfs/archive/refs/tags/libnfs-$pkgver.tar.gz")
sha256sums=('d945cb4f4c8f82ee1f3640893a168810f794a28e1010bb007ec5add345e9df3e')

build () {
	cd libnfs-libnfs-$pkgver
	autoreconf -ivf

	./configure --prefix=/usr	\
		--enable-shared		\
		--enable-utils		\
		--disable-examples	\
		--enable-pthread	\
		--enable-year2038

	make
}

check() {
	cd libnfs-libnfs-$pkgver
	make check
}

package() {
	cd libnfs-libnfs-$pkgver
	make install DESTDIR=$pkgdir
}
