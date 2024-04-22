# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=texinfo
pkgver=7.1
pkgrel=1
pkgdesc='GNU documentation system for on-line information and printed output'
arch=(x86_64 aarch64 riscv64)
url='https://www.gnu.org/software/texinfo/'
license=(GPL3)
groups=(base-devel)
depends=(ncurses perl sh musl)
source=("https://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('deeec9f19f159e046fdf8ad22231981806dac332cc372f1c763504ad82b30953')

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check()
{
  make -C $pkgname-$pkgver check
}

package()
{
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  rm -f $pkgdir/usr/share/info/dir
  gzip $pkgdir/usr/share/info/*
}
