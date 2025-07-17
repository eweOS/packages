# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libwebp
pkgver=1.6.0
pkgrel=1
pkgdesc='A library to encode and decode images in WebP format.'
url='https://chromium.googlesource.com/webm/libwebp'
arch=(x86_64 aarch64 riscv64 loongarch64)
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

sha256sums=('93a852c2b3efafee3723efd4636de855b46f9fe1efddd607e1f42f60fc8f2136')
