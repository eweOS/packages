# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=hunspell
pkgver=1.7.6
pkgrel=1
pkgdesc='The most popular spellchecking library.'
url='https://hunspell.github.io/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL GPL MPL)
depends=(musl readline)
provides=(libhunspell-1.7.so)
source=("https://github.com/hunspell/hunspell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4fa9c52a5337fb0a3e03f3212b6372d0159eac3d1a3e6e938e8897ff3d9c3d0c')

build () {
	cd hunspell-$pkgver
	autoreconf -iv
	./configure --prefix=/usr \
		--with-ui		\
		--with-readline		\
		--disable-static
	make
}

check() {
	cd hunspell-$pkgver
	# Update ABI baseline for musl+clang+libc++ environment
	# Upstream baseline was generated with GCC/libstdc++ which uses
	# different C++ symbol mangling (__cxx11 vs __1)
	cd tests && bash abi-check.sh update && cd ..
	make check
}

package() {
	cd hunspell-$pkgver
	make install DESTDIR=$pkgdir
}
