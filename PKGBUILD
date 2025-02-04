# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=diffutils
pkgver=3.11
pkgrel=1
pkgdesc='A package of several programs related to finding differences between files.'
url='https://www.gnu.org/software/diffutils/'
arch=(x86_64 aarch64 riscv64 loongarch64)
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

# check() {
#	cd diffutils-$pkgver
#	make check
# }

package() {
	cd diffutils-$pkgver
	make install DESTDIR=${pkgdir}
}

sha256sums=('a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e')
