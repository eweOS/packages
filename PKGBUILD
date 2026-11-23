# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=hunspell
pkgver=1.7.6
pkgrel=1
pkgdesc='The most popular spellchecking library.'
url='https://hunspell.github.io/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL-2.1-or-later OR GPL-2.0-or-later OR MPL-1.1')
depends=(musl readline)
provides=(libhunspell-1.7.so)
source=("hunspell-$pkgver.tar.gz::https://github.com/hunspell/hunspell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4fa9c52a5337fb0a3e03f3212b6372d0159eac3d1a3e6e938e8897ff3d9c3d0c')

build () {
	cd hunspell-$pkgver
	autoreconf -iv
	./configure --prefix=/usr \
		--with-ui		\
		--with-readline		\
		--disable-static
	make
}

check() {
	cd hunspell-$pkgver
	# MAKEFLAGS sets LIBTOOL=slibtool; use the generated wrapper for tests.
	make check LIBTOOL="$PWD/libtool"
}

package() {
	cd hunspell-$pkgver
	make install DESTDIR=$pkgdir
	_install_license_ COPYING COPYING
	_install_license_ COPYING.LESSER COPYING-LGPL
	_install_license_ COPYING.MPL COPYING-MPL
}
