# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=patchelf
pkgver=0.19.1
pkgrel=1
pkgdesc='A small utility to modify the dynamic linker and RPATH of ELF executables.'
url='https://github.com/NixOS/patchelf'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(musl)
makedepends=(lld)
source=("https://github.com/NixOS/patchelf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('39cd33c4810f10ec479d22b8ee6cf8e7acb77c356f3864e3270e2d45f7d23448')

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
