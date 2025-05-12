# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gtkwave
pkgver=3.3.124
pkgrel=1
pkgdesc='A fully featured GTK+ based wave viewer'
url='https://gtkwave.github.io/gtkwave/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
# tcl: not enabled, tk is missing.
depends=(gtk3 libbz2 zlib-ng)
makedepends=(gperf)
source=("https://gtkwave.sourceforge.net/gtkwave-gtk3-$pkgver.tar.gz")
sha256sums=('4b1590e05e3e3ae26e34fa80aff369254397379b2f970cfa99150b8b97e535cf')
_dir="$pkgname-gtk3-$pkgver"

prepare() {
	_patch_ "$_dir"

	cd "$_dir"
	autoreconf -fiv
}

build() {
	cd "$_dir"

	./configure --prefix=/usr \
		--disable-judy		\
		--disable-tcl		\
		--enable-gtk3		\
		--disable-mime-update
	make
}

check() {
	cd "$_dir"
	make check
}

package() {
	cd "$_dir"
	make install DESTDIR="$pkgdir"
}
