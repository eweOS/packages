# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libvpx
pkgver=1.13.1
pkgrel=0
pkgdesc='Library for the vp8/vp9 codecs'
url='https://www.webmproject.org/'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(perl nasm)
source=("https://github.com/webmproject/libvpx/archive/v$pkgver/libvpx-v$pkgver.tar.gz")
provides=('libvpx.so')

prepare () {
	cd libvpx-$pkgver
	sed -e 186,188d -i configure
}

build () {
	cd libvpx-$pkgver
	export CC=clang
	export LD=clang
	./configure	\
		--prefix=/usr				\
		--enable-postproc			\
		--enable-vp9-postproc			\
		--enable-vp8				\
		--enable-vp9				\
		--enable-vp9-highbitdepth		\
		--enable-shared
	
	make
}

package() {
	cd libvpx-$pkgver
	make install DESTDIR=$pkgdir
	install -Dm 644 LICENSE $pkgdir/usr/share/licenses/libvpx/LICENSE
}
sha256sums=('00dae80465567272abd077f59355f95ac91d7809a2d3006f9ace2637dd429d14')
