# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=patchelf
pkgver=0.18.0
pkgrel=1
pkgdesc='A small utility to modify the dynamic linker and RPATH of ELF executables.'
url='https://github.com/NixOS/patchelf'
arch=(x86_64 aarch64 riscv64)
license=(GPL-3.0-or-later)
depends=(musl)
makedepends=(lld)
source=("https://github.com/NixOS/patchelf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1451d01ee3a21100340aed867d0b799f46f0b1749680028d38c3f5d0128fb8a7')

build () {
	cd patchelf-$pkgver
	./bootstrap.sh

	export CFLAGS="-fuse-ld=lld $CFLAGS"
	export CXXFLAGS="-fuse-ld=lld $CXXFLAGS"
	./configure --prefix=/usr
	make
}

check() {
	cd patchelf-$pkgver

	# Fix shared-rpath.sh
	# make check
}

package() {
	cd patchelf-$pkgver
	make install DESTDIR=$pkgdir
}
