# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=verilator
pkgver=5.030
pkgrel=1
pkgdesc='Verilog/SystemVerilog simulator.'
url='https://www.veripool.org/verilator/'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-3.0-or-later)
depends=(zlib-ng perl)
makedepends=(cmake samurai python help2man)
source=("https://github.com/verilator/verilator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9e7e97257ca3825fcc75acbed792b03c3ec411d6808ad209d20917705407eac')

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
