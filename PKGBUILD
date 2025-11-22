# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=nudoku
pkgver=6.0.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo' 'gettext')
makedepends=('autoconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jubalh/nudoku/archive/$pkgver.tar.gz")
sha512sums=('be333541ef4c74634d71ded60aa929553e3f76d87ce2f24218042a669861f07adcbd03eb05152590b28f8da3b5c4396c394da1116426f1ebc58fbde8b198eaa0')

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
