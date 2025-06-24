# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20250622
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftp.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('69f578cf11f1b124ba3c2b673a16641debe63aeb3d2ac4cec5ad65f8a53d489b')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
