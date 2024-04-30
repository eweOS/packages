# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=(libx264 x264)
_fullhash=31e19f92f00c7003fa115047ce50978bc98c3a0d
pkgver=20231001.${_fullhash:0:7}
pkgrel=1
url="https://www.videolan.org/developers/x264.html"
arch=(x86_64 aarch64 riscv64)
license=(GPL2)
depends=(musl)
makedepends=(nasm)
source=("https://code.videolan.org/videolan/x264/-/archive/${_fullhash}/x264-${_fullhash}.tar.gz")
sha256sums=('d053c9d86988d6bc78237ca5205865c5ddf99c98ef4cd9927eec8f6d388f6dd9')

build() {
	cd x264-$_fullhash
	export CC=clang
	./configure --prefix=/usr --enable-shared --enable-lto
	make
	make install DESTDIR=fake
}

package_x264() {
	pkgdesc="video encoder for the H.264/MPEG-4 AVC standard"
	depends=(libx264)
	mkdir -p $pkgdir/usr
	mv x264-$_fullhash/fake/usr/bin $pkgdir/usr
}

package_libx264() {
	pkgdesc="x264 video coding library"
	depends=(musl)
	provides=(libx264.so)
	mkdir -p $pkgdir/usr
	mv x264-$_fullhash/fake/usr/lib x264-$_fullhash/fake/usr/include $pkgdir/usr
}
