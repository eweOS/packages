# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libmarisa
pkgver=0.2.6
pkgrel=2
pkgdesc='Matching Algorithm with Recursively Implemented StorAge'
url='https://github.com/s-yata/marisa-trie'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(autoconf automake libtool)
provides=(libmarisa.so)
source=("https://github.com/s-yata/marisa-trie/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Fix-detection-of-MARISA_WORD_SIZE.patch")
sha256sums=('1063a27c789e75afa2ee6f1716cc6a5486631dcfcb7f4d56d6485d2462e566de'
            '3df8a4e26b767a1cfde93c862c7d45d685b982d19fa4404c938258e31cba248d')

prepare() {
	_patch_ marisa-trie-$pkgver
}

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

