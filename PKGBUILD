# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=autoconf-archive
pkgver=2026.11.11
pkgrel=1
epoch=1
pkgdesc="A collection of freely re-usable Autoconf macros"
arch=('any')
url="https://www.gnu.org/software/autoconf-archive/"
license=('GPL3')
depends=('autoconf')
optdepends=('automake: macros for use with it')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2c18f15e2b3bb79e09622b27391df07d8608ce9f07fbfc7c1143fa683891ab26')

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
