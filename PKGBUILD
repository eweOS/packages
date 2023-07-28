# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libraw1394
pkgver=2.1.2
pkgrel=3
arch=(x86_64 aarch64 riscv64)
license=('LGPL2.1')
pkgdesc="Provides an API to the Linux IEEE1394 (FireWire) driver"
depends=('musl')
makedepends=('pkgconf')
url="https://ieee1394.wiki.kernel.org/index.php/Main_Page"
source=(https://www.kernel.org/pub/linux/libs/ieee1394/${pkgname}-${pkgver}.tar.xz)
validpgpkeys=('955C0098E5C46EF9A152481479F36FB2545D79D0')
sha256sums=('03ccc69761d22c7deb1127fc301010dd13e70e44bb7134b8ff0d07590259a55e')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
