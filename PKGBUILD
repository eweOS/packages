# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=mousepad
pkgver=0.6.2
pkgrel=1
pkgdesc='A simple text editor for the Xfce desktop environment.'
url='https://docs.xfce.org/apps/mousepad/start'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
# Missing: gspell libxfce4ui
depends=(glib gtk3 gtksourceview4)
makedepends=(xfce4-dev-tools)
source=("https://archive.xfce.org/src/apps/mousepad/${pkgver%.*}/mousepad-$pkgver.tar.bz2")
sha256sums=('e7cacb3b8cb1cd689e6341484691069e73032810ca51fc747536fc36eb18d19d')

build () {
	cd mousepad-$pkgver
	./configure --prefix=/usr \
		--disable-polkit		\
		--disable-plugin-gspell		\
		--enable-gtksourceview4
	make
}

check() {
	cd mousepad-$pkgver
	make check
}

package() {
	cd mousepad-$pkgver
	make install DESTDIR=$pkgdir
}
