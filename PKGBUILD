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
sha512sums=('4995b1463342b7b90f0caf85accd1fcfd64c88736eae70b60ac6e7893e9a838fe3e0a26f79cd5c3b7fca12c1d98ae8885491a8f26055b6e51469f58d163c0f4e')

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
