# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libmarisa
pkgver=0.2.7
pkgrel=1
pkgdesc='Matching Algorithm with Recursively Implemented StorAge'
url='https://github.com/s-yata/marisa-trie'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
depends=(musl)
makedepends=(autoconf automake libtool)
provides=(libmarisa.so)
source=("https://github.com/s-yata/marisa-trie/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Fix-detection-of-MARISA_WORD_SIZE.patch")
sha256sums=('d4e0097d3a78e2799dfc55c73420d1a43797a2986a4105facfe9a33f4b0ba3c2'
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

