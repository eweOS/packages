# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ctags
pkgver=6.2.20260830.0
pkgrel=1
pkgdesc=' A maintained ctags implementation.'
url='https://github.com/universal-c1tags/ctags'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(libseccomp jansson libyaml libxml2)
source=("https://github.com/universal-ctags/ctags/archive/refs/tags/p$pkgver.tar.gz")
sha256sums=('0c5ea02604f5146c2a415f0f621e846f8fac7e901de59f6dea65f79ab6f3bcae')

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

