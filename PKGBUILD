# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=swig
pkgver=4.4.0
pkgrel=1
pkgdesc='Language binding tool for C/C++'
url='https://www.swig.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom:SWIG)
depends=(pcre2)
source=("https://prdownloads.sourceforge.net/swig/swig-$pkgver.tar.gz")
sha256sums=('c3f8e5dcd68c18aa19847b33b0a1bb92f07e904c53ae9cf5ae4ff8727a72927e')

build () {
	cd swig-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd swig-$pkgver
	make install DESTDIR=$pkgdir
	_install_license_ LICENSE
	_install_license_ LICENSE-UNIVERSITIES
}
