# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxml2
_pkgver_major=2.11
_pkgver_minor=5
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(x86_64 aarch64 riscv64)
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz')
makedepends=('python')
url="http://www.xmlsoft.org/"
source=(https://download.gnome.org/sources/${pkgname}/${_pkgver_major}/${pkgname}-${pkgver}.tar.xz)
md5sums=('b2e7332289f5784087448a0717f45ac3')

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
