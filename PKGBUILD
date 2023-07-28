# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libopus
pkgdesc='A totally open, royalty-free, highly versatile audio codec.'
pkgver=1.3.1
pkgrel=0
url='https://opus-codec.org/'
license=('BSD')
depends=('musl')
source=("https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz")
sha256sums=('65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d')
arch=(x86_64 aarch64 riscv64)
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
