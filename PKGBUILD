# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=diffutils
pkgver=3.10
pkgrel=0
pkgdesc='A package of several programs related to finding differences between files.'
url='https://www.gnu.org/software/diffutils/'
arch=(x86_64 aarch64)
license=(GPL3)
depends=(musl)
source=("https://ftp.gnu.org/gnu/diffutils/diffutils-$pkgver.tar.xz")

build () {
	cd diffutils-$pkgver
	./configure \
		--prefix=/usr			\
		--program-prefix=gnu-
	make
}

check() {
	cd diffutils-$pkgver
	make check
}

package() {
	cd diffutils-$pkgver
	make install DESTDIR=${pkgdir}
}

sha256sums=('90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e')
