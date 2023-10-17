# Maintainer: David Wang <wangyudong2002@outlook.com>

pkgname=base16384
pkgdesc="Encode binary file to printable utf16be, and vice versa."
pkgver=2.2.5
pkgrel=1
license=('GPL')
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fumiama/base16384"
makedepends=('cmake')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fe10c4028f550abef138a5644e143ff56bab8195ddaf066b423202379076c859750261ea40950dc33aaecdfe1a7dc9f6baaa537cb4ba534e9d9307b3bab47f1e')

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
