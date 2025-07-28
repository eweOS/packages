# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ctags
pkgver=6.2.20250727.0
pkgrel=1
pkgdesc=' A maintained ctags implementation.'
url='https://github.com/universal-c1tags/ctags'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(libseccomp jansson libyaml libxml2)
source=("https://github.com/universal-ctags/ctags/archive/refs/tags/p$pkgver.tar.gz")
sha256sums=('5e220083eef20e0c3e6387f281e6663c52059aed0026a61fa619efbf84a3b9c3')

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

