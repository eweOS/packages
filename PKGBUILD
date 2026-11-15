# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=automake
pkgver=1.20
pkgrel=1
pkgdesc='A tool for automatically generating Makefile.in files.'
arch=('any')
license=('GPL-2.0-or-later')
url="http://www.gnu.org/software/automake"
depends=('perl' 'bash')
makedepends=('autoconf')
source=(https://ftpmirror.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('f6f34dad4cbe395715762b0710f7c511e39bd5cf777e6b95818ccbecf7714248')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
