# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libvterm
pkgver=0.3.3
pkgrel=3
pkgdesc='An abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator.'
url='https://www.leonerd.org.uk/code/libvterm/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
checkdepends=(perl)
provides=(libvterm.so)
source=("https://www.leonerd.org.uk/code/libvterm/libvterm-$pkgver.tar.gz"
	"0001-link-uninstalled-libvterm.patch")
sha256sums=('09156f43dd2128bd347cbeebe50d9a571d32c64e0cf18d211197946aff7226e0'
            'f4a9d4d743c05588e299caa46f6a27092cdb5cad461d16456ed16d41019dc553')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make install	\
		PREFIX=/usr	\
		DESTDIR=$pkgdir
}
