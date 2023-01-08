# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxml2
_pkgver_major=2.10
_pkgver_minor=3
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz')
makedepends=('python')
url="http://www.xmlsoft.org/"
source=(https://download.gnome.org/sources/${pkgname}/${_pkgver_major}/${pkgname}-${pkgver}.tar.xz)
md5sums=('SKIP')

build()
{
  cd ${pkgname}-${pkgver}
  autoreconf
  ./configure \
    --prefix=/usr \
    --with-threads \
    --with-history \
    --with-python=/usr/bin/python
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
