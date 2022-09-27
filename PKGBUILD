# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=tetris
pkgver=7.0.1
pkgrel=1
pkgdesc="Port of OpenBSD tetris for Linux."
arch=(x86_64)
url="https://github.com/eNV25/tetris"
license=('BSD')
depends=('ncurses' 'libbsd')
makedepends=('bsd-compat-headers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
