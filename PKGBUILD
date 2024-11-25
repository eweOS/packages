# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfconf
pkgver=4.19.4
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
sha256sums=('3630809d0100af9b921c0ca5245d60230a361548a3b1d370eaecc5d37198dceb'
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
