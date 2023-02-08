# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=gpg
pkgdesc='GNU Privacy Guard'
pkgver=2.4.0
pkgrel=0
url='https://gnupg.org'
license=('GPL2')
depends=('musl' 'libassuan' 'libgpg-error' 'npth' 'libksba' 'pinentry'
	 'libgcrypt')
source=("https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2")
sha256sums=('SKIP')
arch=(x86_64 aarch64)

build() {
	cd gnupg-${pkgver}
	./configure --with-libksba-prefix=/usr --prefix=/usr
	make
}

package() {
	cd gnupg-${pkgver}
	make DESTDIR="${pkgdir}/" install
}
