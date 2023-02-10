# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libopus
pkgdesc='A totally open, royalty-free, highly versatile audio codec.'
pkgver=1.3.1
pkgrel=0
url='https://opus-codec.org/'
license=('BSD')
depends=('musl')
source=("https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz")
sha256sums=('SKIP')
arch=(x86_64 aarch64)
provides=("libopus.so")

build() {
	cd opus-${pkgver}
	./configure --prefix=/usr
	make
}

check() {
	cd opus-${pkgver}
	make check
}

package() {
	cd opus-${pkgver}
	make install DESTDIR=${pkgdir}/
	install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/libopus/LICENSE
}
