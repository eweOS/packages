# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20250722
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftp.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('91a81ff4129cdf5ad3c3c45ec033e75f2bbea5447f4b6813a0d8cfe8e5c7843b')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
