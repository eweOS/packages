# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=dejagnu
pkgver=1.6.3
pkgrel=1
pkgdesc='A framework for testing other programs'
url='https://www.gnu.org/software/dejagnu/'
arch=(any)
license=(GPL-3.0-or-later)
depends=(bash expect)
source=("https://ftp.gnu.org/gnu/dejagnu/dejagnu-$pkgver.tar.gz")
sha256sums=('87daefacd7958b4a69f88c6856dbd1634261963c414079d0c371f589cd66a2e3')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

# Require dejagnu to be installed. Disable to ease bootstrapping
# check() {
# 	cd "$pkgname-$pkgver"
# 	make check
# }

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
