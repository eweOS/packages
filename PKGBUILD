# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libwebp
pkgver=1.3.1
pkgrel=0
pkgdesc='A library to encode and decode images in WebP format.'
url='https://chromium.googlesource.com/webm/libwebp'
arch=(x86_64 aarch64)
license=(BSD)
depends=(musl libjpeg libpng libtiff)
source=("https://github.com/webmproject/libwebp/archive/refs/tags/v$pkgver.tar.gz")

build () {
	cd libwebp-$pkgver
	./autogen.sh
	./configure \
		--prefix=/usr				\
		--disable-gif				\
		--disable-sdl				\
		--enable-shared				\
		--enable-png				\
		--enable-jpeg				\
		--enable-tiff				\
		--enable-libwebpdecoder			\
		--enable-libwebpextras
	make
}

package() {
	cd libwebp-$pkgver
	make install DESTDIR=$pkgdir
	install -Dm 644 COPYING $pkgdir/usr/share/licenses/libwebp/COPYING
}

sha256sums=('1c45f135a20c629c31cebcba62e2b399bae5d6e79851aa82ec6686acedcf6f65')
