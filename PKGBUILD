# Maintainer: David Wang <wangyudong2002@outlook.com>

pkgname=base16384
pkgdesc="Encode binary file to printable utf16be, and vice versa."
pkgver=2.2.3
pkgrel=1
license=('GPL')
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fumiama/base16384"
makedepends=('cmake')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c60ed4be256ae6a313d6fac4b7042d761d0a1afd04287b5ff153fc325bd8992a03dac8ec0799b1425eded4e7b538c128ffa4d8f55e85f1fbc00e79cf320422cc')

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
