# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gtkwave
pkgver=3.3.126
pkgrel=1
pkgdesc='A fully featured GTK+ based wave viewer'
url='https://gtkwave.github.io/gtkwave/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
# tcl: not enabled, tk is missing.
depends=(gtk3 libbz2 zlib-ng)
makedepends=(gperf)
source=("https://gtkwave.sourceforge.net/gtkwave-gtk3-$pkgver.tar.gz")
sha256sums=('965019d74829746b5d1d382a9cf1e272246c91101d0e131f0da512c94ba5816a')
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
