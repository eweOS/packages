# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iso-codes
pkgver=4.16.0
pkgrel=1
pkgdesc='Lists of the country, language, and currency names'
url='https://salsa.debian.org/iso-codes-team/iso-codes'
arch=(any)
license=(LGPL)
makedepends=(python)
source=(https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v$pkgver/iso-codes-v$pkgver.tar.gz)
sha256sums=('7c990fc39a05975bedb0175e3ff09fc383048815f68b462abbf055a8032e66cc')

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
}
