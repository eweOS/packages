# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20241222
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftp.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('7a1b038cb198604107f9601b7c2a176e78d845858121708fa8690671cb301a79')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
