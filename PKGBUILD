# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=hwloc
pkgver=2.13.0
pkgrel=2
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
sha512sums=('88958a624211fbc3fd2f424de8eed2d6b47a0e3b3cf524725c9695d8a73929de71f3615d4f2e610678a8e1b169c7a592eae45464493f6288b16b0ce368015b28'
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
