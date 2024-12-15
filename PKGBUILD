# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libxfce4util
pkgver=4.20.0
pkgrel=1
pkgdesc='Extension library for Xfce'
url='https://developer.xfce.org/libxfce4util/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(musl gettext-tiny glib)
makedepends=(xfce4-dev-tools gtk-doc gobject-introspection vala gobject-introspection)
provides=(libxfce4util.so)
source=("https://gitlab.xfce.org/xfce/libxfce4util/-/archive/libxfce4util-$pkgver/libxfce4util-libxfce4util-$pkgver.tar.gz")
sha256sums=('4facb35a7af56f9230da67d0dff9d7d7bb87de3851ba5711edf900bc3e6fae06')
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
