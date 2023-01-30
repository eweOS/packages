# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libgcrypt
pkgver=1.10.1
pkgrel=0
pkgdesc='A general purpose cryptographic library originally based on code from GnuPG.'
arch=(x86_64 aarch64)
url='https://gnupg.org/software/libgcrypt'
license=(LGPLv2 GPLv2)
source=('https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.1.tar.bz2')
sha256sums=('SKIP')

build() {
	cd libgcrypt-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd libgcrypt-${pkgver}
	make install
}

check() {
	cd libgcrypt-${pkgver}
	make check
}
