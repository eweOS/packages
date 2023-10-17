# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libsndfile
pkgdesc='Library for reading and writing files containing sampled sound'
pkgver=1.2.2
pkgrel=1
url='https://libsndfile.github.io/libsndfile/'
license=('LGPL')
depends=('musl' 'libflac' 'libogg' 'libvorbis' 'libopus')
makedepends=('python')
source=("https://github.com/libsndfile/libsndfile/releases/download/${pkgver}/libsndfile-${pkgver}.tar.xz")
sha256sums=('3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e')
arch=(x86_64 aarch64 riscv64)
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
