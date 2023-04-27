# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libgcrypt
pkgver=1.10.2
pkgrel=1
pkgdesc='A general purpose cryptographic library originally based on code from GnuPG.'
arch=(x86_64 aarch64)
url="https://gnupg.org/software/$pkgname"
license=(LGPLv2 GPLv2)
source=("https://gnupg.org/ftp/gcrypt/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03')

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
