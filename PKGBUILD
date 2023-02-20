# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=(libx264 x264)
pkgver=eaa68fad
_fullhash=eaa68fad9e5d201d42fde51665f2d137ae96baf0
pkgrel=0
pkgdesc_libx264="x264 video coding library"
pkgdesc_x264="video encoder for the H.264/MPEG-4 AVC standard"
url="https://www.videolan.org/developers/x264.html"
arch=(x86_64 aarch64)
license=('GPL2')
depends=('musl')
makedepends=('nasm')
source=("https://code.videolan.org/videolan/x264/-/archive/${_fullhash}/x264-${_fullhash}.tar.gz")
sha256sums=('SKIP')
provides_libx264=('libx264.so')

build() {
	cd x264-${_fullhash}
	export CC=clang
	./configure --prefix=/usr --enable-shared --enable-lto
	make
	make install DESTDIR=fake
}

package_x264() {
	mkdir -p ${pkgdir}/usr
	mv x264-${_fullhash}/fake/usr/bin ${pkgdir}/usr
}

package_libx264() {
	mkdir -p ${pkgdir}/usr
	mv x264-${_fullhash}/fake/usr/lib x264-${_fullhash}/fake/usr/include ${pkgdir}/usr
}
