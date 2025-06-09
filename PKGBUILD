# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=mousepad
pkgver=0.6.5
pkgrel=1
pkgdesc='A simple text editor for the Xfce desktop environment.'
url='https://docs.xfce.org/apps/mousepad/start'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
groups=('xfce4-goodies')
# Missing gspell and polkit
depends=(musl glib gtk3 gtksourceview4 libxfce4util libxfce4ui)
makedepends=(meson ninja)
source=("https://archive.xfce.org/src/apps/mousepad/${pkgver%.*}/mousepad-$pkgver.tar.xz")
sha256sums=('21762bc8c3c4f120a4a509ce39f4a5a58dbc10e3f0da66cdc6d9a8c735fff2ac')

build () {
	ewe-meson build mousepad-$pkgver \
		-Dgtksourceview4=enabled	\
		-Dpolkit=disabled		\
		-Dkeyfile-settings=false	\
		-Dgspell-plugin=disabled	\
		-Dshortcuts-plugin=enabled	\
		-Dtest-plugin=enabled
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
