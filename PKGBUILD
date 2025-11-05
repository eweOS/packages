# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=parallel
pkgver=20251022
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
url='https://www.gnu.org/software/parallel/'
arch=(any)
license=(GPL-3.0-only)
depends=(perl)
source=("https://ftp.gnu.org/gnu/parallel/parallel-$pkgver.tar.bz2")
sha256sums=('474326d59688d2fc078cf89a7b0b4a11cc9684229b3fa0158fe8bc03f1b69ee1')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
