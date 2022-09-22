# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libraw1394
pkgver=2.1.2
pkgrel=3
arch=('x86_64')
license=('LGPL2.1')
pkgdesc="Provides an API to the Linux IEEE1394 (FireWire) driver"
depends=('musl')
makedepends=('pkgconf')
url="https://ieee1394.wiki.kernel.org/index.php/Main_Page"
source=(https://www.kernel.org/pub/linux/libs/ieee1394/${pkgname}-${pkgver}.tar.xz)
validpgpkeys=('955C0098E5C46EF9A152481479F36FB2545D79D0')
sha256sums=('SKIP')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   ./configure --prefix=/usr 
   make
}

package () {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install
}

