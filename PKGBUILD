# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libwebp
pkgver=1.3.2
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

sha256sums=('c2c2f521fa468e3c5949ab698c2da410f5dce1c5e99f5ad9e70e0e8446b86505')
