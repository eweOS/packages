# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=verilator
pkgver=5.040
pkgrel=1
pkgdesc='Verilog/SystemVerilog simulator.'
url='https://www.veripool.org/verilator/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-3.0-or-later)
depends=(zlib-ng perl)
makedepends=(cmake samurai python help2man)
checkdepends=(python-distro)
source=("https://github.com/verilator/verilator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56c7c46314adfad06dd093b77823bfd9b49ebef72342549f790718199c3e8223')

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
