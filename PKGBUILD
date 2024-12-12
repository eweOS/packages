# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ctags
pkgver=6.1.20241208.0
pkgrel=1
pkgdesc=' A maintained ctags implementation.'
url='https://github.com/universal-c1tags/ctags'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(libseccomp jansson libyaml libxml2)
source=("https://github.com/universal-ctags/ctags/archive/refs/tags/p$pkgver.tar.gz")
sha256sums=('db62d24aa53b4cf1c9abb9ed3e14f3e774761b86eec01aa9edcceef1ace1bf2f')

build () {
	cd ctags-p$pkgver
	./autogen.sh
	./configure --prefix=/usr	# TODO: LTO
	make
}

# TODO: fix check

package() {
	cd ctags-p$pkgver
	make install DESTDIR=$pkgdir
}

