# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxml2
_pkgver_major=2.12
_pkgver_minor=2
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=2
pkgdesc="XML parsing library, version 2"
arch=(x86_64 aarch64 riscv64)
license=('MIT')
depends=('zlib' 'ncurses' 'xz' 'icu')
makedepends=('python')
url="http://www.xmlsoft.org/"
source=(https://download.gnome.org/sources/${pkgname}/${_pkgver_major}/${pkgname}-${pkgver}.tar.xz)
md5sums=('ea61cf9b3f3afd61fde0e05a54fc5ddd')

build()
{
  cd ${pkgname}-${pkgver}
  autoreconf
  ./configure \
    --prefix=/usr \
    --with-threads \
    --with-history \
    --with-icu \
    --with-python=/usr/bin/python
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
