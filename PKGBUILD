# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=automake
pkgver=1.16.5
pkgrel=1
pkgdesc='A tool for automatically generating Makefile.in files.'
arch=('any')
license=('GPL')
url="http://www.gnu.org/software/automake"
groups=('base-devel')
depends=('perl' 'bash')
makedepends=('autoconf')
source=(ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('4017e96f89fca45ca946f1c5db6be714')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
