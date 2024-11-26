# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libxfce4util
pkgver=4.19.4
pkgrel=2
pkgdesc='Extension library for Xfce'
url='https://developer.xfce.org/libxfce4util/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(musl gettext-tiny glib)
makedepends=(xfce4-dev-tools gtk-doc gobject-introspection vala gobject-introspection)
provides=(libxfce4util.so)
source=("https://gitlab.xfce.org/xfce/libxfce4util/-/archive/libxfce4util-$pkgver/libxfce4util-libxfce4util-$pkgver.tar.gz")
sha256sums=('07d64c5ed4ef44c14f13e5d0ae0232c646e86c29eaaf5722812465b2ef2fa66a')
_dirname="$pkgname-$pkgname-$pkgver"

build() {
	cd "$_dirname"
	./autogen.sh --prefix=/usr			\
		--sbindir=/usr/bin		\
		--enable-maintainer-mode
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
