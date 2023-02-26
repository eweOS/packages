# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>

pkgname=typespeed
pkgver=0.6.5
pkgrel=10
pkgdesc="Test your typing speed, and get your fingers' CPS."
arch=(x86_64 aarch64)
url="http://typespeed.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	"config.sub::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD"
	"config.guess::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare()
{
  cd $pkgname-$pkgver
  # fix error unknown type name clock_t
  sed -i "1i #include <time.h>" src/typespeed.h
  cp $srcdir/{config.sub,config.guess} .
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
