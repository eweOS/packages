# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ctags
pkgver=6.1.20250427.0
pkgrel=1
pkgdesc=' A maintained ctags implementation.'
url='https://github.com/universal-c1tags/ctags'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(libseccomp jansson libyaml libxml2)
source=("https://github.com/universal-ctags/ctags/archive/refs/tags/p$pkgver.tar.gz")
sha256sums=('d95556c9a59679e1d6be079806af06b15ae6f98c8ae54ed4c3fb883d4e1a0342')

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

