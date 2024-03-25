# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=pinentry
pkgdesc='The standard pinentry collection.'
pkgver=1.3.0
pkgrel=1
url='https://gnupg.org/ftp/gcrypt/pinentry/'
license=('GPL2')
depends=('musl' 'libassuan' 'libgpg-error' 'ncurses')
source=("$url/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de')
arch=(x86_64 aarch64 riscv64)

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

