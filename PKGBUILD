# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=swig
pkgver=4.3.1
pkgrel=1
pkgdesc='Language binding tool for C/C++'
url='https://www.swig.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom:SWIG)
depends=(pcre2)
source=("https://prdownloads.sourceforge.net/swig/swig-$pkgver.tar.gz")
sha256sums=('44fc829f70f1e17d635a2b4d69acab38896699ecc24aa023e516e0eabbec61b8')

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
