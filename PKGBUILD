# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libsndfile
pkgdesc='Library for reading and writing files containing sampled sound'
pkgver=1.2.0
pkgrel=0
url='https://libsndfile.github.io/libsndfile/'
license=('LGPL')
depends=('musl' 'libflac' 'libogg' 'libvorbis' 'libopus')
makedepends=('python')
source=("https://github.com/libsndfile/libsndfile/releases/download/${pkgver}/libsndfile-${pkgver}.tar.xz")
sha256sums=('0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a')
arch=(x86_64 aarch64)
provides=("libsndfile.so")

build() {
	cd libsndfile-${pkgver}
	./configure --prefix=/usr
	make
}

check() {
	cd libsndfile-${pkgver}
	make check
}

package() {
	cd libsndfile-${pkgver}
	make install DESTDIR=${pkgdir}
}
