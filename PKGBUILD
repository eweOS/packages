# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libwebp
pkgver=1.4.0
pkgrel=1
pkgdesc='A library to encode and decode images in WebP format.'
url='https://chromium.googlesource.com/webm/libwebp'
arch=(x86_64 aarch64 riscv64)
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

sha256sums=('12af50c45530f0a292d39a88d952637e43fb2d4ab1883c44ae729840f7273381')
