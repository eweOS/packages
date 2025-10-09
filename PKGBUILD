# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20250922
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftp.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('ee3ddc3125ef7ddcd97dde5ba64ab7f71874faa2f5d7720acdd3e4bf5265a32b')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
