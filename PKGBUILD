# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=autoconf-archive
pkgver=2024.10.16
pkgrel=1
epoch=1
pkgdesc="A collection of freely re-usable Autoconf macros"
arch=('any')
url="https://www.gnu.org/software/autoconf-archive/"
license=('GPL3')
depends=('autoconf')
optdepends=('automake: macros for use with it')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219c592d62502a57363')

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
