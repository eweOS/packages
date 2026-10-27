# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=patchelf
pkgver=0.19.2
pkgrel=1
pkgdesc='A small utility to modify the dynamic linker and RPATH of ELF executables.'
url='https://github.com/NixOS/patchelf'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(musl)
makedepends=(lld)
source=("https://github.com/NixOS/patchelf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('05e674fcc89ef3ffbd851266d063f45f13bd16facec9839a54d0095b930c6f07')

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
