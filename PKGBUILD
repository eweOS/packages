# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=fim
pkgver=0.7.1
pkgrel=1
pkgdesc='A universal image viewer inspired by GNU/Linux concepts.'
url='https://www.nongnu.org/fbi-improved/'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(musl libexif)
makedepends=(linux-headers sdl2 gtk3)
optdepends=("sdl2: GUI Support with SDL2"
	    "gtk3: GUI support with GTK3")
source=("http://download.savannah.nongnu.org/releases/fbi-improved/fim-$pkgver.tar.gz")
sha256sums=('3425648cd53e02849da44c20b061c038838dd489a59bcd67e6b0a706ec06779a')

build () {
	cd fim-$pkgver
	./configure --prefix=/usr \
		--disable-static	\
		--enable-framebuffer	\
		--enable-sdl		\
		--enable-gtk		\
		--enable-exif		\
		--enable-long-int-wars	\
		--disable-caca
	make
}

check() {
	cd fim-$pkgver
	# busybox timeout does not work
	# make check
}

package() {
	cd fim-$pkgver
	make install DESTDIR=$pkgdir
}
