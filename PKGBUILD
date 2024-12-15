# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfconf
pkgver=4.20.0
pkgrel=1
pkgdesc='D-Bus-based configuration storage system'
url='https://docs.xfce.org/xfce/xfconf/start'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl gettext-tiny glib libxfce4util)
makedepends=(xfce4-dev-tools perl gtk-doc)
checkdepends=(dbus)
source=("https://gitlab.xfce.org/xfce/xfconf/-/archive/xfconf-$pkgver/xfconf-xfconf-$pkgver.tar.gz"
	"fix-abicheck.patch")
sha256sums=('a432495a0f1e0aab7cd644373ed6dec7da0f974f4deee3d763b7d8553a0bfc3c'
            '69a947e576acf685cab5a31a572faa4a1483a0bc14e7afeef9e424413db33864')
_dirname="$pkgname-$pkgname-$pkgver"

prepare() {
	_patch_ "$_dirname"
}

build() {
	cd "$_dirname"
	./autogen.sh --prefix=/usr \
			--enable-maintainer-mode
	make
}

check() {
	cd "$_dirname"
	dbus-run-session make check
}

package() {
	cd "$_dirname"
	make install DESTDIR="$pkgdir"

	# TODO: add dinit service
	rm -r "$pkgdir"/usr/lib/systemd
}
