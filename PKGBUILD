# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iso-codes
pkgver=4.18.0
pkgrel=1
pkgdesc='Lists of the country, language, and currency names'
url='https://salsa.debian.org/iso-codes-team/iso-codes'
arch=(any)
license=(LGPL-2.1-or-later)
makedepends=(python)
source=(https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v$pkgver/iso-codes-v$pkgver.tar.gz)
sha256sums=('511f67bf4b51aa77f17c45adbff533242b50f1e370fe49a5706b6341902fac87')

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
}
