# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=hyphen
pkgver=2.8.8
_majorminorver=${pkgver%.*}
pkgrel=1
pkgdesc='Library for high quality hyphenation and justification'
url='https://sourceforge.net/projects/hunspell/files/Hyphen'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-or-later OR LGPL-2.1-or-later OR MPL-1.1')
depends=(musl)
provides=(libhyphen.so)
source=("https://sourceforge.net/projects/hunspell/files/Hyphen/$_majorminorver/hyphen-$pkgver.tar.gz")
sha256sums=('304636d4eccd81a14b6914d07b84c79ebb815288c76fe027b9ebff6ff24d5705')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"

	make check
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
	_install_license_ COPYING	COPYING
	_install_license_ COPYING.LGPL	COPYING-LGPL
	_install_license_ COPYING.MPL	COPYING-MPL
}
