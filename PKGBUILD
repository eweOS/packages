# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>

pkgname=typespeed
pkgver=0.6.5
pkgrel=9
pkgdesc="Test your typing speed, and get your fingers' CPS."
arch=('x86_64')
url="http://typespeed.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver
  # fix error unknown type name clock_t
  sed -i "1i #include <time.h>" src/typespeed.h
}

build() {
  cd $pkgname-$pkgver

  CFLAGS+=" -fcommon" \
  ./configure --prefix=/usr \
  	      --localstatedir=/var \
  	      --sysconfdir=/etc
  make CC=cc
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make CC=cc DESTDIR="$pkgdir" install
}
