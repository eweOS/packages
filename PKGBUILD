# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pciutils
pkgver=3.15.0
pkgrel=1
pkgdesc="PCI bus configuration space access library and tools"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
groups=(base)
makedepends=(zlib linux-headers)
provides=(libpci.so)
url="https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git"
source=("https://www.kernel.org/pub/software/utils/pciutils/pciutils-${pkgver}.tar.xz")
sha256sums=('c02940f430841ecf158d5d9a50007afc4d5353c8678a2455003ca0b2c4e9f5ff')

_makeargs=(
  PREFIX=/usr
  CC=cc
  SHAREDIR=/usr/share/hwdata
  SBINDIR=/usr/bin
  SHARED=yes
)

build() {
  cd $pkgname-$pkgver
  make "${_makeargs[@]}"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" "${_makeargs[@]}" install install-lib
}
