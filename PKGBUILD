# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=fim
pkgver=0.8.0
pkgrel=1
pkgdesc='A universal image viewer inspired by GNU/Linux concepts.'
url='https://www.nongnu.org/fbi-improved/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl libexif)
makedepends=(linux-headers sdl2 gtk3)
optdepends=("sdl2: GUI Support with SDL2"
	    "gtk3: GUI support with GTK3")
source=("http://download.savannah.nongnu.org/releases/fbi-improved/fim-$pkgver.tar.gz")
sha256sums=('2c6b33c834ca41f7a6d6b2020eb4ff5c1facbab40b7c511c8ff93c74492bdd9d')

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
