# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20260322
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftpmirror.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('764680e932f4d0d21cf0329bd9f9eed659895de16836001f6491533b822befe0')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
