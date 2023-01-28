# Maintainer: David Wang <wangyudong2002@outlook.com>

pkgname=base16384
pkgdesc="Encode binary file to printable utf16be, and vice versa."
pkgver=2.2.2
pkgrel=1
license=('GPL')
arch=('x86_64' 'aarch64')
url="https://github.com/fumiama/base16384"
makedepends=('cmake')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
	cd $pkgname-$pkgver
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
	cd $pkgname-$pkgver/build
	make DESTDIR=$pkgdir install
}
