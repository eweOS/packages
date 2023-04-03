# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=pinentry
pkgdesc='The standard pinentry collection.'
pkgver=1.2.1
pkgrel=0
url='https://gnupg.org/ftp/gcrypt/pinentry/'
license=('GPL2')
depends=('musl' 'libassuan' 'libgpg-error' 'ncurses')
source=("$url/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067')
arch=(x86_64 aarch64)

build() {
	cd pinentry-${pkgver}
	./configure --prefix=/usr --enable-pinentry-tty --enable-pinentry-curses
	make
}

check() {
	cd pinentry-${pkgver}
	make check
}

package() {
	cd pinentry-${pkgver}
	make DESTDIR="${pkgdir}/" install
}

