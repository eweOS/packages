# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfce4-dev-tools
pkgver=4.20.0
pkgrel=1
pkgdesc='a collection of tools and macros for Xfce'
url='https://docs.xfce.org/xfce/xfce4-dev-tools/start'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl glib meson)
makedepends=(libxslt)
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/xfce4-dev-tools-$pkgver.tar.bz2")
sha256sums=('1fba39a08a0ecc771eaa3a3b6e4272a4f0b9e7c67d0f66e780cd6090cd4466aa')

build () {
	cd xfce4-dev-tools-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	cd xfce4-dev-tools-$pkgver
	make check
}

package() {
	# run-time depends
	depends+=(gtk-doc)
	cd xfce4-dev-tools-$pkgver
	make install DESTDIR=$pkgdir
}
