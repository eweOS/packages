# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=mousepad
pkgver=0.6.3
pkgrel=3
pkgdesc='A simple text editor for the Xfce desktop environment.'
url='https://docs.xfce.org/apps/mousepad/start'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
groups=('xfce4-goodies')
# Missing: gspell
depends=(glib gtk3 gtksourceview4 libxfce4util libxfce4ui)
makedepends=(xfce4-dev-tools)
source=("https://archive.xfce.org/src/apps/mousepad/${pkgver%.*}/mousepad-$pkgver.tar.bz2")
sha256sums=('2ff162c185f18014ab9c82c2ac2dfce4fba20eb0005e7690ee27f00b9cb929b9')

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
