# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=iverilog
pkgver=13.0
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
sha256sums=('c897bbfa9848688982c6d5c30529fc29d68df0b9ff22ffa73bad89db73a7ce49')

prepare() {
	cd "$pkgname-$_srcver"

	sh ./autoconf.sh

	# Manually update config.{guess,sub}, the configure script couldn't
	# be reproduced with modern Autotools.
	cp /usr/share/autoconf/build-aux/config.{guess,sub} .
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
