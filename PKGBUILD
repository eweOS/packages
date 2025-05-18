# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libmarisa
pkgver=0.2.7
pkgrel=1
pkgdesc='Matching Algorithm with Recursively Implemented StorAge'
url='https://github.com/s-yata/marisa-trie'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl)
provides=(libmarisa.so)
source=("$pkgname-$pkgver.tar.gz::https://github.com/s-yata/marisa-trie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4e0097d3a78e2799dfc55c73420d1a43797a2986a4105facfe9a33f4b0ba3c2')

prepare() {
	cd marisa-trie-$pkgver
	autoreconf -i
}

build () {
	cd marisa-trie-$pkgver

	./configure --prefix=/usr
	make
}

check() {
	cd marisa-trie-$pkgver
	make check
}

package() {
	cd marisa-trie-$pkgver

	make install DESTDIR="$pkgdir"
	_install_license_ COPYING.md
}

