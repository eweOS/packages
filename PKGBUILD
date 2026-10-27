# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=groff
pkgver=1.24.2
pkgrel=1
pkgdesc='GNU Troff typesettings system.'
url='https://www.gnu.org/software/groff/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(musl)
checkdepends=(diffutils)
options=(emptydirs)
source=("https://ftp.gnu.org/gnu/groff/groff-$pkgver.tar.gz")
sha256sums=('f9c1efd5bebbe37fc6e1063db7473ce8df1e3e0be4ff0f43ce04fce57e9c5dd9')

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
