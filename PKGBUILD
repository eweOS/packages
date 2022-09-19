# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nmon
pkgver=16n
pkgrel=2
pkgdesc="AIX & Linux Performance Monitoring tool"
arch=('x86_64')
url="http://nmon.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=("https://downloads.sourceforge.net/$pkgname/lmon$pkgver.c"
	fix-fstab-header.patch)
sha256sums=('SKIP' 'SKIP')

prepare() {
  patch $srcdir/../lmon$pkgver.c fix-fstab-header.patch \
	|| patch $srcdir/lmon$pkgver.c fix-fstab-header.patch
}

build() {
  cc -o nmon lmon$pkgver.c $LDFLAGS $CFLAGS -g -O3 -lncurses -lm -D X86
}

package() {
  install -D -m 0755 nmon "$pkgdir/usr/bin/nmon"
}
