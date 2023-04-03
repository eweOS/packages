# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pciutils
pkgver=3.9.0
pkgrel=1
pkgdesc="PCI bus configuration space access library and tools"
arch=(x86_64 aarch64)
license=(GPL)
groups=(base)
makedepends=(zlib)
source=("https://www.kernel.org/pub/software/utils/pciutils/pciutils-${pkgver}.tar.xz")
sha256sums=('cdea7ae97239dee23249a09c68a19a287a3f109fbeb2c232ebb616cb38599012')

build()
{
  cd $pkgname-$pkgver
  make PREFIX=/usr CC=cc SHAREDIR=/usr/share/hwdata SBINDIR=/usr/bin
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" PREFIX=/usr SHAREDIR=/usr/share/hwdata SBINDIR=/usr/bin install
}
