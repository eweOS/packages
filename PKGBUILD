# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pciutils
pkgver=3.14.0
pkgrel=2
pkgdesc="PCI bus configuration space access library and tools"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
groups=(base)
makedepends=(zlib linux-headers)
provides=(libpci.so)
url="https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git"
source=("https://www.kernel.org/pub/software/utils/pciutils/pciutils-${pkgver}.tar.xz")
sha256sums=('e7713409882813991d2269d125e40dad1f54a019a52b78b3962941c1d4a6f86f')

_makeargs=(
  PREFIX=/usr
  CC=cc
  SHAREDIR=/usr/share/hwdata
  SBINDIR=/usr/bin
  SHARED=yes
)

build()
{
  cd $pkgname-$pkgver
  make "${_makeargs[@]}"
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" "${_makeargs[@]}" install install-lib
}
