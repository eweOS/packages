# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=groff
pkgver=1.25.0
pkgrel=1
pkgdesc='GNU Troff typesettings system.'
url='https://www.gnu.org/software/groff/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(musl)
checkdepends=(diffutils)
options=(emptydirs)
source=("https://ftp.gnu.org/gnu/groff/groff-$pkgver.tar.gz")
sha256sums=('24d103a07eb79e418963bce206c8771b649871f83bda2fd4c2e65529c1c56921')

build () {
	cd groff-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	mkdir -p $srcdir/bin
	ln -sf /usr/bin/gnu-diff $srcdir/bin/diff

	cd groff-$pkgver
	# neqn must find eqn in the build tree, not an installed copy.
	PATH="$srcdir/bin:$PATH" GROFF_BIN_PATH="$PWD" make check
}

package() {
	cd groff-$pkgver
	make install DESTDIR=$pkgdir
}
