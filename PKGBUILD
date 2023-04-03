# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=nudoku
pkgver=2.1.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('any')
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo' 'gettext')
makedepends=('autoconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jubalh/nudoku/archive/$pkgver.tar.gz")
sha512sums=('dde16d1dccc1cae8d156f57fccf8b112f3fee7d23b912b5cd7ecc092ecbf04a8e85f469e53fa02e6bd2d0b9498e4a65a219e1aad8091f82638dceab32f320670')

prepare() {
	cd "$pkgname-$pkgver"
	# fix use of undeclared identifier 'LC_ALL'
	sed -i "1i #include <locale.h>" src/main.c
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr --enable-cairo
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
