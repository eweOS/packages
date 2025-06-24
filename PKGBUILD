# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libogg
pkgdesc='Ogg bitstream library'
pkgver=1.3.6
pkgrel=1
url='https://xiph.org/ogg/'
license=('BSD')
depends=('musl')
makedepends=('autoconf')
source=("https://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.gz")
sha256sums=('83e6704730683d004d20e21b8f7f55dcb3383cdf84c0daedf30bde175f774638')
arch=(x86_64 aarch64 riscv64 loongarch64)
provides=('libogg.so')

prepare() {
	cd libogg-${pkgver}
	autoreconf -fiv
}

build() {
	cd libogg-${pkgver}
	./configure --prefix=/usr
	make
}
package() {
	cd libogg-${pkgver}
	make install DESTDIR=${pkgdir}/
	install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/libogg/LICENSE
}
