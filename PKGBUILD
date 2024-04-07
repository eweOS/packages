# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=nudoku
pkgver=3.0.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=(x86_64 aarch64 riscv64)
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo' 'gettext')
makedepends=('autoconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jubalh/nudoku/archive/$pkgver.tar.gz")
sha512sums=('7a87bb73d2a440b361544681c7924c62284fc3d6ac0122ddda51f5539a837ceb89fc7fcef06b134599cd7a11e2ba37fa49df0f89d5d8ab4cd454551492cb6d6e')

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
