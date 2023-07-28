# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libvorbis
pkgdesc='Ogg Vorbis codec'
pkgver=1.3.7
pkgrel=0
url='https://xiph.org/vorbis/'
license=('BSD')
depends=('musl' 'libogg')
source=("https://ftp.osuosl.org/pub/xiph/releases/vorbis/libvorbis-${pkgver}.tar.gz")
sha256sums=('0e982409a9c3fc82ee06e08205b1355e5c6aa4c36bca58146ef399621b0ce5ab')
arch=(x86_64 aarch64 riscv64)
provides=('libvorbis.so' 'libvorbisenc.so' 'libvorbisfile.so')

build() {
	cd libvorbis-${pkgver}
	./configure --prefix=/usr
	make
}
package() {
	cd libvorbis-${pkgver}
	make install DESTDIR=${pkgdir}/
	install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/libvorbis/LICENSE
}
