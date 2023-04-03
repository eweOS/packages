# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=autoconf-archive
pkgver=2023.02.20
pkgrel=1
epoch=1
pkgdesc="A collection of freely re-usable Autoconf macros"
arch=('any')
url="https://www.gnu.org/software/autoconf-archive/"
license=('GPL3')
depends=('autoconf')
optdepends=('automake: macros for use with it')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
