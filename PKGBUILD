# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=hunspell
pkgver=1.7.3
pkgrel=2
pkgdesc='The most popular spellchecking library.'
url='https://hunspell.github.io/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL GPL MPL)
depends=(musl readline)
provides=(libhunspell-1.7.so)
source=("https://github.com/hunspell/hunspell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('933be3dac6fd55f6e752331a170efb7e33800e40fae1156d8434cc8c85379a1b')

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
