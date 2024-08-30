# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=verilator
pkgver=5.028
pkgrel=1
pkgdesc='Verilog/SystemVerilog simulator.'
url='https://www.veripool.org/verilator/'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-3.0-or-later)
depends=(zlib-ng perl)
makedepends=(cmake samurai python help2man)
source=("https://github.com/verilator/verilator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02d4b6f34754b46a97cfd70f5fcbc9b730bd1f0a24c3fc37223397778fcb142c')

build () {
	cd verilator-$pkgver

	autoconf
	export VERILATOR_AUTHOR_SITE=1
	./configure --prefix=/usr \
		--disable-coverage		\
		--disable-tcmalloc		\
		--disable-longtests		\
		--disable-ccwarn		\
		--disable-partial-static
	make
}

check() {
	cd verilator-$pkgver
	make test
}

package() {
	cd verilator-$pkgver
	make install DESTDIR=$pkgdir
}
