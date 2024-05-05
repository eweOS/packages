# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=hunspell
pkgver=1.7.2
pkgrel=1
pkgdesc='The most popular spellchecking library.'
url='https://hunspell.github.io/'
arch=(x86_64 aarch64 riscv64)
license=(LGPL GPL MPL)
depends=(musl readline)
provides=(libhunspell-1.7.so)
source=("https://github.com/hunspell/hunspell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69fa312d3586c988789266eaf7ffc9861d9f6396c31fc930a014d551b59bbd6e')

build () {
	cd hunspell-$pkgver
	autoreconf -iv
	./configure --prefix=/usr \
		--with-ui		\
		--with-readline		\
		--disable-static
	make
}

check() {
	cd hunspell-$pkgver
	make check
}

package() {
	cd hunspell-$pkgver
	make install DESTDIR=$pkgdir
}
