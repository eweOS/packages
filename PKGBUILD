# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iso-codes
pkgver=4.19.0
pkgrel=1
pkgdesc='Lists of the country, language, and currency names'
url='https://salsa.debian.org/iso-codes-team/iso-codes'
arch=(any)
license=(LGPL-2.1-or-later)
makedepends=(python)
source=(https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v$pkgver/iso-codes-v$pkgver.tar.gz)
sha256sums=('4b143a891feb7d1bb64e44fe3ef253ef36ba1185d1d129c1425338dc6e46e27d')

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
}
