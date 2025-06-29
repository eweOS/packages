# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=iverilog
pkgver=12.0
_srcver=${pkgver/./_}
pkgrel=1
pkgdesc='A Verilog HDL compiler'
url='https://steveicarus.github.io/iverilog/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl llvm-libs)
makedepends=(gperf)
# iverilog uses ld -r to merge multiple objects (what?), which doesn't work
# with ones that actually contain LLVM bytecode. Disable LTO to workaround this.
options=(!lto)
source=("https://github.com/steveicarus/iverilog/archive/refs/tags/v${_srcver}.tar.gz")
sha256sums=('a68cb1ef7c017ef090ebedb2bc3e39ef90ecc70a3400afb4aa94303bc3beaa7d')

prepare() {
	cd "$pkgname-$_srcver"

	sh ./autoconf.sh
}

build() {
	cd "$pkgname-$_srcver"

	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$_srcver"

	make check
}

package() {
	cd "$pkgname-$_srcver"

	make install DESTDIR="$pkgdir"
}
