# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iso-codes
pkgver=4.17.0
pkgrel=1
pkgdesc='Lists of the country, language, and currency names'
url='https://salsa.debian.org/iso-codes-team/iso-codes'
arch=(any)
license=(LGPL)
makedepends=(python)
source=(https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v$pkgver/iso-codes-v$pkgver.tar.gz)
sha256sums=('dd5ca13db77ec6dd1cc25f5c0184290a870ec1fed245d8e39a04ff34f59076c3')

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
}
