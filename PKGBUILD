# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libsndfile
pkgdesc='Library for reading and writing files containing sampled sound'
pkgver=1.2.2
pkgrel=5
url='https://libsndfile.github.io/libsndfile/'
license=('LGPL-2.1-or-later')
depends=('musl' 'libflac' 'libogg' 'libvorbis' 'libopus')
makedepends=('python' 'autoconf' 'linux-headers')
source=(
  "https://github.com/libsndfile/libsndfile/releases/download/${pkgver}/libsndfile-${pkgver}.tar.xz"
  "CVE-2022-33065.patch::https://github.com/libsndfile/libsndfile/commit/0754562e13d2e63a248a1c82f90b30bc0ffe307c.patch"
)
sha256sums=('3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e'
            'f42720a0307a5d3785c2719729d0eeaa0f15e6fe1c3645f5028fef89a35d7bd2')
arch=(x86_64 aarch64 riscv64 loongarch64)
provides=("libsndfile.so")

prepare() {
	_patch_ libsndfile-${pkgver}
	cd libsndfile-${pkgver}
	autoreconf -fiv
}

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
