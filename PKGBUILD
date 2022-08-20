# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xz
pkgver=5.2.6
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files'
arch=('x86_64')
license=('GPL' 'LGPL' 'custom')
source=("https://tukaani.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -d -m755 "${pkgdir}/usr/share/licenses/xz/"
	ln -sf /usr/share/doc/xz/COPYING "${pkgdir}/usr/share/licenses/xz/"
	ln -sf /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/doc/xz/COPYING.GPLv2"
}
