# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=nudoku
pkgver=4.0.1
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=(x86_64 aarch64 riscv64)
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo' 'gettext')
makedepends=('autoconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jubalh/nudoku/archive/$pkgver.tar.gz")
sha512sums=('88f23d310dc73a6d93bce9dd2b42c3f3d03f14860beda0c70c4c3897b2b7ac0820514f20d336592a44fd59a9f5db1b5351ff76e08dfb770fe1bcc4a0ea56bf0e')

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
