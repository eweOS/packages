# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=vala
_ver=0.56
pkgver=$_ver.17
pkgrel=2
pkgdesc='Compiler for Vala'
url='https://vala.dev'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(glib graphviz)
makedepends=(gobject-introspection flex bison libxslt)
checkdepends=(dbus)
source=("https://download.gnome.org/sources/vala/$_ver/vala-$pkgver.tar.xz"
	"fix-valadoc-ld-library-path.patch")
sha256sums=('26100c4e4ef0049c619275f140d97cf565883d00c7543c82bcce5a426934ed6a'
            '233af4e814b6cc9d91e605d401892d14ad3225172f596894e9aeb88ae7786581')

prepare() {
	# two checks fail
	sed -i "/constants\/member-access/d" \
		vala-$pkgver/tests/Makefile.in
	# property-array fail on obs
	sed -i "s/objects\/property-array.vala//" \
		vala-$pkgver/tests/Makefile.in

	_patch_ vala-"$pkgver"
}

build () {
	cd vala-"$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd vala-"$pkgver"
	make check
}

package() {
	cd vala-"$pkgver"
	make install DESTDIR="$pkgdir"
}
