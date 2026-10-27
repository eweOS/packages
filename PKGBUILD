# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20260922
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftpmirror.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('54837e9e8c16134a3c2e95f91c5fe2f7893d4cc89f252b26735713ceca866387')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
