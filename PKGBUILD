# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=libexif
pkgver=0.6.24
pkgrel=2
pkgdesc='Library to parse an EXIF file and read the data from those tags'
url='https://github.com/libexif/libexif'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL')
depends=('musl')
provides=('libexif.so')
source=(${url}/archive/${pkgname}-${pkgver//./_}-release.tar.gz)
sha256sums=('d3fb7c47829ec4d2def39aa38f4c35a0891763448a05dbf216a329a12bf198f9')

prepare()
{
  cd ${pkgname}-${pkgname}-${pkgver//./_}-release
  autoreconf -fiv
}

build()
{
  cd ${pkgname}-${pkgname}-${pkgver//./_}-release
  ./configure --prefix=/usr
  make
}

package()
{
  cd ${pkgname}-${pkgname}-${pkgver//./_}-release
  make DESTDIR="${pkgdir}" install
}
