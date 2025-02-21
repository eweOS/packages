# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gtkwave
pkgver=3.3.121
pkgrel=1
pkgdesc='A fully featured GTK+ based wave viewer'
url='https://gtkwave.github.io/gtkwave/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
# tcl: not enabled, tk is missing.
depends=(gtk3 libbz2 zlib-ng)
makedepends=(gperf)
source=("https://gtkwave.sourceforge.net/gtkwave-gtk3-$pkgver.tar.gz"
	"0001-disable-x11.patch")
sha256sums=('54aa45788d6d52afb659c3aef335aafde0ef2c8990a7770f8eaa64e57f227346'
            'b4c77423d023334abd847890788dfda7c3d9a9299d1717aec0d52ac10b99763c')
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
