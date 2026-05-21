# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nmon
pkgver=16s
pkgrel=2
pkgdesc="AIX & Linux Performance Monitoring tool"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://nmon.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=("https://unlimited.dl.sourceforge.net/project/$pkgname/lmon$pkgver.c"
  fix-fstab-header.patch)
sha256sums=('0736ce0f729e48c124a7ba566c069c5a234511cc9c6ac9277da92f8bb44f2b11'
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
