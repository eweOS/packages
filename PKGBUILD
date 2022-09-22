# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=libexif
pkgver=0.6.24
pkgrel=1
pkgdesc='Library to parse an EXIF file and read the data from those tags'
url='https://github.com/libexif/libexif'
arch=(x86_64)
license=('LGPL')
depends=('musl')
provides=('libexif.so')
source=(${url}/archive/${pkgname}-${pkgver//./_}-release.tar.gz)
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgname}-${pkgver//./_}-release
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgname}-${pkgver//./_}-release
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver//./_}-release
  make DESTDIR="${pkgdir}" install
}

