# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=nettle
pkgver=3.8.1
pkgrel=1
pkgdesc="A low-level cryptographic library"
arch=('x86_64')
url="https://www.lysator.liu.se/~nisse/nettle"
license=('GPL2')
depends=('gmp' 'musl')
provides=('libnettle.so' 'libhogweed.so')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr \
		--disable-static
	make
}

check() {
	cd $pkgname-$pkgver
	make -k check
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
