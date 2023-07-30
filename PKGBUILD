# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>

pkgname=typespeed
pkgver=0.6.5
pkgrel=11
pkgdesc="Test your typing speed, and get your fingers' CPS."
arch=(x86_64 aarch64 riscv64)
url="http://typespeed.sourceforge.net"
license=('GPL')
depends=('ncurses')
_config_githash='4ad4bb7c30aca1e705448ba8d51a210bbd47bb52'
_config_url='http://git.savannah.gnu.org/gitweb/?p=config.git'
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	"config.sub::${_config_url};a=blob_plain;f=config.sub;hb=${_config_githash}"
	"config.guess::${_config_url};a=blob_plain;f=config.guess;hb=${_config_githash}")
sha256sums=('5c860385ceed8a60f13217cc0192c4c2b4705c3e80f9866f7d72ff306eb72961'
            '4ca6a19995601877a120ad10d0d96e036dedab134b49b198bf30414c5f1fa18e'
            '851148d33bbe0380794cc3002c32657cd1d32785d387b328299d71745376ec3e')

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
