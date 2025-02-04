# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=diffutils
pkgver=3.11
pkgrel=1
pkgdesc='A package of several programs related to finding differences between files.'
url='https://www.gnu.org/software/diffutils/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(musl)
source=("https://ftp.gnu.org/gnu/diffutils/diffutils-$pkgver.tar.xz")
sha256sums=('a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e')

build () {
	cd diffutils-"$pkgver"
	./configure \
		--prefix=/usr			\
		--program-prefix=gnu-
	make
}

check() {
	make -C "diffutils-$pkgver/tests" check
}

package() {
	cd diffutils-"$pkgver"
	make install DESTDIR="$pkgdir"
}
