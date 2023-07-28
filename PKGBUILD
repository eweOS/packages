# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>

pkgname=typespeed
pkgver=0.6.5
pkgrel=10
pkgdesc="Test your typing speed, and get your fingers' CPS."
arch=(x86_64 aarch64 riscv64)
url="http://typespeed.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	"config.sub::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD"
	"config.guess::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD")
sha256sums=('5c860385ceed8a60f13217cc0192c4c2b4705c3e80f9866f7d72ff306eb72961'
            'b45ba96fa578cfca60ed16e27e689f10812c3f946535e779229afe7a840763e6'
            'bb14470dba3adf469b6e683307b783172b571abca13e7f5a77a4c94ea07b3811')

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
