# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=verilator
pkgver=5.032
pkgrel=1
pkgdesc='Verilog/SystemVerilog simulator.'
url='https://www.veripool.org/verilator/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-3.0-or-later)
depends=(zlib-ng perl)
makedepends=(cmake samurai python help2man)
source=("https://github.com/verilator/verilator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5a262564b10be8bdb31ff4fb67d77bcf5f52fc1b4e6c88d5ca3264fb481f1e41')

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
