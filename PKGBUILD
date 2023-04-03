# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libgcrypt
pkgver=1.10.1
pkgrel=1
pkgdesc='A general purpose cryptographic library originally based on code from GnuPG.'
arch=(x86_64 aarch64)
url="https://gnupg.org/software/$pkgname"
license=(LGPLv2 GPLv2)
source=("https://gnupg.org/ftp/gcrypt/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de')

depends=('musl' 'libgpg-error')

build() {
	cd libgcrypt-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd libgcrypt-${pkgver}
	make DESTDIR="$pkgdir" install
}

check() {
	cd libgcrypt-${pkgver}
	make check
}
