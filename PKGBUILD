# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=swig
pkgver=4.3.0
pkgrel=1
pkgdesc='Language binding tool for C/C++'
url='https://www.swig.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom:SWIG)
depends=(pcre2)
source=("https://prdownloads.sourceforge.net/swig/swig-$pkgver.tar.gz")
sha256sums=('f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e')

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
