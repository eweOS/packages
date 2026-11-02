# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20261022
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftpmirror.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('4fb0d2d4d14a4ef6448c788cb2bcfde9fbe00b8d4bdc637a7e4c08f8c5453a55')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
