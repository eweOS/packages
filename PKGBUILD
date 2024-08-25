# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=a52dec
pkgver=0.8.0
pkgrel=1
pkgdesc='A free library for decoding ATSC A/52 streams'
url='https://git.adelielinux.org/community/a52dec/'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(musl)
makedepends=(linux-headers)
provides=(liba52.so)
source=("https://git.adelielinux.org/community/a52dec/-/archive/v$pkgver/a52dec-v$pkgver.tar.gz")
sha256sums=('470d084074d15416a0f0f300b85b61ddcc1ce105ad14a2aac670a1767ecba8de')

build () {
	cd "$pkgname-v$pkgver"

	aclocal -I autotools
	slibtoolize --force --copy
	autoheader
	automake --add-missing --copy
	autoconf
	rm -f config.cache

	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-v$pkgver"

	make check
}

package() {
	cd "$pkgname-v$pkgver"

	make install DESTDIR="$pkgdir"
}
