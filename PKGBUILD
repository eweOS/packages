# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=swig
pkgver=4.4.1
pkgrel=1
pkgdesc='Language binding tool for C/C++'
url='https://www.swig.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom:SWIG)
depends=(pcre2)
source=("https://prdownloads.sourceforge.net/swig/swig-$pkgver.tar.gz")
sha256sums=('40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306a0a554c6281fcf')

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
