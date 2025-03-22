# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libnfs
pkgver=6.0.2
pkgrel=1
pkgdesc='NFS client library.'
url='https://github.com/sahlberg/libnfs'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause LGPL-2.1-or-later GPL-3.0-or-later)
depends=(musl)
provides=(libnfs.so)
source=("https://github.com/sahlberg/libnfs/archive/refs/tags/libnfs-$pkgver.tar.gz")
sha256sums=('4e5459cc3e0242447879004e9ad28286d4d27daa42cbdcde423248fad911e747')

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
