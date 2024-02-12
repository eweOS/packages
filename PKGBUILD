# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libgcrypt
pkgver=1.10.3
pkgrel=1
pkgdesc='A general purpose cryptographic library originally based on code from GnuPG.'
arch=(x86_64 aarch64 riscv64)
url="https://gnupg.org/software/$pkgname"
license=(LGPLv2 GPLv2)
source=("https://gnupg.org/ftp/gcrypt/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa')

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
