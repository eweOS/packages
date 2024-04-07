# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nmon
pkgver=16p
pkgrel=1
pkgdesc="AIX & Linux Performance Monitoring tool"
arch=(x86_64 aarch64 riscv64)
url="http://nmon.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=("https://downloads.sourceforge.net/$pkgname/lmon$pkgver.c"
  fix-fstab-header.patch)
sha256sums=('5dc6045f6725e3249a969918fae69663a1d669162087720babcdb90fce9e6b2a'
            'a3bf2a06991750aa0b65ff63e3e7494768490b67a61125837251872bb5a6c5ba')

prepare()
{
  patch --follow-symlinks $srcdir/lmon$pkgver.c fix-fstab-header.patch
}

build()
{
  cc -o nmon lmon$pkgver.c $LDFLAGS $CFLAGS -g -O3 -lncurses -lm -D X86
}

package()
{
  install -D -m 0755 nmon "$pkgdir/usr/bin/nmon"
}
