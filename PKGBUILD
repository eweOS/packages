# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=automake
pkgver=1.18.1
pkgrel=3
pkgdesc='A tool for automatically generating Makefile.in files.'
arch=('any')
license=('GPL-2.0-or-later')
url="http://www.gnu.org/software/automake"
depends=('perl' 'bash')
makedepends=('autoconf')
source=(https://ftpmirror.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('168aa363278351b89af56684448f525a5bce5079d0b6842bd910fdd3f1646887')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
