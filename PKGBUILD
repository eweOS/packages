# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=jimtcl
pkgver=0.84
pkgrel=1
pkgdesc='An open-source, small-footprint TCL implementation'
url='http://jim.tcl.tk/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl openssl zlib-ng)
makedepends=(tcl)
provides=(libjim.so)
source=("https://github.com/msteveb/jimtcl/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('435095b436b38b96dd85e8cda13878144813bf52066057f76368db178dd8fea2')

prepare() {
	# Require network connection
	rm "$pkgname-$pkgver"/tests/ssl.test
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr \
		--shared

	# The Makefile inserts "-fPIC" into CC variable of Makefile when
	# building a shared library. Make sure we don't override these two
	# variables in MAKEFLAGS, or "-fPIC" is lost.
	MAKEFLAGS="${MAKEFLAGS/CC=cc CXX=c++/}" make V=1
}

check() {
	cd "$pkgname-$pkgver"

	# Setup a TERM environment variable manually to run interactive tests
	# on GitHub CI
	TERM=ansi make check
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
