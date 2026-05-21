# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=groff
pkgver=1.24.0
pkgrel=2
pkgdesc='GNU Troff typesettings system.'
url='https://www.gnu.org/software/groff/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(musl)
checkdepends=(diffutils)
options=(emptydirs)
source=("https://ftp.gnu.org/gnu/groff/groff-$pkgver.tar.gz")
sha256sums=('e79bbcd8ff3ed0200e7ac55d3962a15e118c1229990213025f2fc8b264727570')

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
}
