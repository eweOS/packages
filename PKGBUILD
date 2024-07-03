# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=hwloc
pkgver=2.11.0
pkgrel=1
pkgdesc="a portable abstraction of hierarchical architectures"
url='https://www.open-mpi.org/projects/hwloc/'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('libxml2' 'libudev')
makedepends=('cairo' 'ncurses')
optdepends=('cairo' 'ncurses')
source=(https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('be5ca33627cfb97515e2779b040775df58ee2fcdcf210ee698e5566fff8bcf17abc57e4923a4e8dd1f5f61858a3bc5fc821fc774a45db4cf5fc3f7c78057f0a2')

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
