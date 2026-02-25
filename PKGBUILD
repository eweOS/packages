# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20260222
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftpmirror.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('c6272a48972a0f2fdd3f39560d698f3c5abd3d8a4de40d52f9772f3a03ae1f48')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
