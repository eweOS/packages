# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=hwloc
pkgver=2.10.0
pkgrel=1
pkgdesc="a portable abstraction of hierarchical architectures"
url='https://www.open-mpi.org/projects/hwloc/'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('libxml2' 'libudev')
makedepends=('cairo' 'ncurses')
optdepends=('cairo' 'ncurses')
source=(https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('8fcf448ef16874862e5cf5a814ecc4885d53817369640bb8a0079b0c7d9294b3933a6a8cf2472e8e104a5c346e09e1fffab401a1976d7b2da0457f0c5271a18a')

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
