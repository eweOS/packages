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
sha512sums=('SKIP')

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
