# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=hwloc
pkgver=2.11.1
pkgrel=1
pkgdesc="a portable abstraction of hierarchical architectures"
url='https://www.open-mpi.org/projects/hwloc/'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('libxml2' 'libudev')
makedepends=('cairo' 'ncurses')
optdepends=('cairo' 'ncurses')
source=(https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('095afab5e7caf2099266b71d7803f2695987eed1c62d7315867b12f8db059d5a5e6f64d6303351cc1a14cfbcf0f7f5a3acedb775a0220f3648d158941c270b28')

build()
{
  cd hwloc-${pkgver}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc
  make
}

check()
{
  cd hwloc-${pkgver}
  # Don't check in ports, clang throws error compiling freebsd sources
  make check | sed -e '/Making check in ports/q'
}

package()
{
  cd hwloc-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
