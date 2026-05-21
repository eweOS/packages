# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=verilator
pkgver=5.046
pkgrel=2
pkgdesc='Verilog/SystemVerilog simulator.'
url='https://www.veripool.org/verilator/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-3.0-or-later)
depends=(zlib-ng perl)
makedepends=(cmake samurai python help2man)
checkdepends=(python-distro)
source=("https://github.com/verilator/verilator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('002bc6d92b203eb8b4612e1d198d8108517d4ec9859e131ef328015352fe6d0c')

build () {
	cd verilator-"$pkgver"

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
	cd verilator-"$pkgver"
	make test
}

package() {
	cd verilator-"$pkgver"
	make install DESTDIR="$pkgdir"
}
