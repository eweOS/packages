# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=groff
pkgver=1.23.0
pkgrel=1
pkgdesc='GNU Troff typesettings system.'
url='https://www.gnu.org/software/groff/'
arch=(x86_64 aarch64 riscv64)
license=(GPL-3.0-or-later)
depends=(musl)
checkdepends=(diffutils)
options=(emptydirs)
source=("https://ftp.gnu.org/gnu/groff/groff-1.23.0.tar.gz")
sha256sums=('6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13')

build () {
	cd groff-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	mkdir -p $srcdir/bin
	ln -s /usr/bin/gnu-diff $srcdir/bin/diff

	cd groff-$pkgver
	PATH="$srcdir/bin:$PATH" make check
}

package() {
	cd groff-$pkgver
	make install DESTDIR=$pkgdir

	rm $pkgdir/usr/lib/charset.alias
}

