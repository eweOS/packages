# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=tclap
pkgname=(tclap tclap-doc)
pkgver=1.4.0
pkgrel=1
pkgdesc='Templatized C++ Command Line Parser Library'
url='https://tclap.sourceforge.net/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
source=("https://sourceforge.net/projects/tclap/files/tclap-$pkgver.tar.gz")
sha256sums=('413014a7e68740d9aa972a058532e3e9959b4af7509d6ae7b11a8c1828378567')

build () {
	cd tclap-$pkgver
	./configure --prefix=/usr
	make
	make install DESTDIR=$srcdir/install
	mv $srcdir/install/usr/share/doc $srcdir
}

check() {
	cd tclap-$pkgver
	make check
}

package_tclap() {
	mv $srcdir/install/usr $pkgdir
	_install_license_ $srcdir/tclap-$pkgver/COPYING
}

package_tclap-doc() {
	mkdir -p $pkgdir/usr/share
	mv $srcdir/doc $pkgdir/usr/share
}
