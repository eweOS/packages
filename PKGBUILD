# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>
# Contributor: Hervé YVIQUEL <elldekaa@gmail.com>

pkgname=hwloc
pkgver=2.8.0
pkgrel=1
pkgdesc='Portable Hardware Locality is a portable abstraction of hierarchical architectures'
url='https://www.open-mpi.org/projects/hwloc/'
arch=(x86_64 aarch64)
license=('BSD')
depends=('glibc' 'libxml2' 'libudev')
makedepends=('cairo' 'ncurses')
optdepends=('cairo' 'ncurses')
source=(https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('SKIP')

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
