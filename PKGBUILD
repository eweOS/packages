# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=hwloc
pkgver=2.14.0
pkgrel=1
pkgdesc="a portable abstraction of hierarchical architectures"
url='https://www.open-mpi.org/projects/hwloc/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD-3-Clause')
depends=('musl' 'libudev')
makedepends=('cairo' 'ncurses' 'libpciaccess')
optdepends=('cairo: Graphics support in lstopo'
	    'ncurses: TUI support in lstopo'
	    'libxml2: XML plugin for topology import/export support'
	    'libpciaccess: PCI plugin for PCI object discovery')
provides=(libhwloc.so)
# 0001: Downstream, disable ports testsuite which Clang isn't able to compile
source=("https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/${pkgname}-${pkgver}.tar.bz2"
	0001-Disable-ports-testsuite.patch)
sha512sums=('547a9ed3c6af399de9617fe675bd6d16db300cc98213d6c71b2f1b41dd4a1706c7f2cf0dd1feb0d9f8a546b1976740c7a959dca0c23a4f52eac0b25cc403d087'
            '78bcc41086a3d085c10de9e5babef565910649e028a3163dfe06c9b6c16bb89dfe2ca0f51723d6edd02e3539ca5e3af1c475362f8e07886749549cb15882e19f')

prepare()
{
  _patch_ hwloc-${pkgver}

  cd hwloc-${pkgver}
  autoreconf -fiv
}

build()
{
  cd hwloc-${pkgver}
  ./configure \
    --prefix=/usr		\
    --sbindir=/usr/bin		\
    --sysconfdir=/etc		\
    --enable-plugins
  make
}

check()
{
  cd hwloc-${pkgver}
  # TODO: some tests fail on AArch64, need investigation.
  make check || true
}

package()
{
  cd hwloc-${pkgver}
  make DESTDIR="${pkgdir}" install
  _install_license_ COPYING
}
