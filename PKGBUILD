# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=swig
pkgver=4.2.1
pkgrel=1
pkgdesc='Language binding tool for C/C++'
url='https://www.swig.org/'
arch=(x86_64 aarch64 riscv64)
license=(custom:SWIG)
depends=(pcre2)
source=("https://prdownloads.sourceforge.net/swig/swig-4.2.1.tar.gz")
sha256sums=('fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8')

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
