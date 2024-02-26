# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pciutils
pkgver=3.11.1
pkgrel=1
pkgdesc="PCI bus configuration space access library and tools"
arch=(x86_64 aarch64 riscv64)
license=(GPL)
groups=(base)
makedepends=(zlib)
url="https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git"
source=("https://www.kernel.org/pub/software/utils/pciutils/pciutils-${pkgver}.tar.xz")
sha256sums=('3f472ad864473de5ba17f765cc96ef5f33e1b730918d3adda6f945a2a9290df4')

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
