# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libmarisa
pkgver=0.2.6
pkgrel=1
pkgdesc='Matching Algorithm with Recursively Implemented StorAge'
url='https://github.com/s-yata/marisa-trie'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(autoconf automake libtool)
provides=(libmarisa.so)
source=("https://github.com/s-yata/marisa-trie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1063a27c789e75afa2ee6f1716cc6a5486631dcfcb7f4d56d6485d2462e566de')

build () {
	cd marisa-trie-$pkgver
	autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	cd marisa-trie-$pkgver
	make check
}

package() {
	cd marisa-trie-$pkgver
	make install DESTDIR=${pkgdir}
}

