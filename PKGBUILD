# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20250422
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftp.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('10f0a7b7fbed87edcbd63a403fdc0ee1a1f86c241a3605f33162b4b9aff248dd')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
