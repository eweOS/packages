# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libnfs
pkgver=8.1.0
pkgrel=1
pkgdesc='NFS client library.'
url='https://github.com/sahlberg/libnfs'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause LGPL-2.1-or-later GPL-3.0-or-later)
depends=(musl krb5)
provides=(libnfs.so)
source=("https://github.com/sahlberg/libnfs/archive/refs/tags/libnfs-$pkgver.tar.gz")
sha256sums=('7a8c39bed7678b84ac0ab4607b64b5ce44e14c1bbe463cc072314ff4e75754ae')

build() {
	cd "libnfs-libnfs-$pkgver"
	autoreconf -ivf

	# musl CMSG_NXTHDR trips -Wcast-align.
	CFLAGS+=" -Wno-error=cast-align"

	# gnutls and rdma-core are not available in eweOS.
	./configure --prefix=/usr	\
		--enable-shared		\
		--enable-utils		\
		--disable-examples	\
		--disable-rdma		\
		--disable-tls		\
		--enable-pthread

	make
}

check() {
	cd "libnfs-libnfs-$pkgver"
	# ld_timeout.so is only used by the shell tests and does not link with mold.
	make -C tests check bin_SCRIPTS=
}

package() {
	cd "libnfs-libnfs-$pkgver"
	make install DESTDIR="$pkgdir"

	_install_license_ LICENCE-BSD.txt LICENCE-BSD.txt
	_install_license_ LICENCE-LGPL-2.1.txt LICENCE-LGPL-2.1.txt
	_install_license_ LICENCE-GPL-3.txt LICENCE-GPL-3.txt
}
