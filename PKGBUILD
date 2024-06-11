# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pciutils
pkgver=3.13.0
pkgrel=1
pkgdesc="PCI bus configuration space access library and tools"
arch=(x86_64 aarch64 riscv64)
license=(GPL)
groups=(base)
makedepends=(zlib linux-headers)
url="https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git"
source=("https://www.kernel.org/pub/software/utils/pciutils/pciutils-${pkgver}.tar.xz")
sha256sums=('77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926')

prepare()
{
  cd $pkgname-$pkgver
  sed -i '1s/^/#include<libgen.h> /' lib/sysfs.c
}

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
