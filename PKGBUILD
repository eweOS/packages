# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gtkwave
pkgver=3.3.127
pkgrel=1
pkgdesc='A fully featured GTK+ based wave viewer'
url='https://gtkwave.github.io/gtkwave/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
# tcl: not enabled, tk is missing.
depends=(gtk3 libbz2 zlib-ng)
makedepends=(gperf)
source=("https://gtkwave.sourceforge.net/gtkwave-gtk3-$pkgver.tar.gz")
sha256sums=('f19da2db43b27bbcc669725843451945a68c3a4ce232562e341d6f63b80b55e4')
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
