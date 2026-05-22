# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=typespeed
pkgver=0.6.5
pkgrel=15
pkgdesc="Test your typing speed, and get your fingers' CPS."
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://typespeed.sourceforge.net"
license=('GPL')
depends=('ncurses')
makedepends=('autoconf')
source=(https://typespeed.sourceforge.net/$pkgname-$pkgver.tar.gz)
sha256sums=('5c860385ceed8a60f13217cc0192c4c2b4705c3e80f9866f7d72ff306eb72961')

prepare()
{
  cd $pkgname-$pkgver
  # fix error unknown type name clock_t
  sed -i "1i #include <time.h>" src/typespeed.h
  cp /usr/share/autoconf/build-aux/{config.sub,config.guess} .
}

build()
{
  cd $pkgname-$pkgver

  CFLAGS+=" -fcommon" \
    ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc
  make CC=cc
}

package()
{
  cd $srcdir/$pkgname-$pkgver

  make CC=cc DESTDIR="$pkgdir" install
}
