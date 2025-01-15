# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ctags
pkgver=6.1.20250112.0
pkgrel=1
pkgdesc=' A maintained ctags implementation.'
url='https://github.com/universal-c1tags/ctags'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(libseccomp jansson libyaml libxml2)
source=("https://github.com/universal-ctags/ctags/archive/refs/tags/p$pkgver.tar.gz")
sha256sums=('616ce4e7c0c90464fdd8224b890535af0636f22b639890d725149fa4d17103eb')

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

