# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libvterm
pkgver=0.3.3
pkgrel=1
pkgdesc='An abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator.'
url='https://www.leonerd.org.uk/code/libvterm/'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
makedepends=(libtool)
checkdepends=(perl)
provides=(libvterm.so)
source=("https://www.leonerd.org.uk/code/libvterm/libvterm-$pkgver.tar.gz")
sha256sums=('09156f43dd2128bd347cbeebe50d9a571d32c64e0cf18d211197946aff7226e0')

build() {
	cd libvterm-$pkgver
	make PREFIX=/usr \
		libvterm.la
	make PREFIX=/usr LDFLAGS="-L."
}

check() {
	cd libvterm-$pkgver
	make test
}

package() {
	cd libvterm-$pkgver
	make install	\
		PREFIX=/usr	\
		DESTDIR=$pkgdir
}
