# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=automake
pkgver=1.17
pkgrel=1
pkgdesc='A tool for automatically generating Makefile.in files.'
arch=('any')
license=('GPL')
url="http://www.gnu.org/software/automake"
groups=('base-devel')
depends=('perl' 'bash')
makedepends=('autoconf')
source=(ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('7ab3a02318fee6f5bd42adfc369abf10')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
