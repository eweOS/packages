# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libxfce4ui
pkgver=4.19.6
pkgrel=1
pkgdesc='Widgets library for the Xfce desktop environment'
url='https://docs.xfce.org/xfce/libxfce4ui/start'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(musl gettext-tiny glib gtk3 libxfce4util xfconf libepoxy)
makedepends=(xfce4-dev-tools vala)
provides=(libxfceui-2.so)
source=("https://gitlab.xfce.org/xfce/libxfce4ui/-/archive/libxfce4ui-$pkgver/libxfce4ui-libxfce4ui-$pkgver.tar.gz"
	"fix-abicheck.patch")
sha256sums=('ead04dbb38ea5863625b294ca2dffba57b0fec280328b18b8fb4be035aa1db9a'
	    'SKIP')
_dirname="$pkgname-$pkgname-$pkgver"

prepare() {
	_patch_ "$_dirname"
}

build() {
	cd "$_dirname"
	./autogen.sh --prefix=/usr \
		--disable-x11			\
		--enable-wayland		\
		--disable-libsm			\
		--disable-gudev			\
		--enable-epoxy			\
		--enable-gtk-doc		\
		--disable-vala			\
		--enable-tests
	make
}

check() {
	cd "$_dirname"
	make check
}

package() {
	cd "$_dirname"
	make install DESTDIR="$pkgdir"
}
