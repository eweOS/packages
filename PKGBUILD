# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfce4-dev-tools
pkgver=4.19.1
pkgrel=1
pkgdesc='a collection of tools and macros for Xfce'
url='https://docs.xfce.org/xfce/xfce4-dev-tools/start'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(musl glib)
makedepends=(libxslt)
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/xfce4-dev-tools-$pkgver.tar.bz2")
sha256sums=('db6fc72353cd0e3b13f4e210ab3940a5284f82f89f06601a8505417c2fd7ef8a')

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
	cd xfce4-dev-tools-$pkgver
	make install DESTDIR=$pkgdir
}
