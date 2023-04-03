# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=texinfo
pkgver=6.8
pkgrel=2
pkgdesc='GNU documentation system for on-line information and printed output'
arch=(x86_64 aarch64)
url='https://www.gnu.org/software/texinfo/'
license=(GPL3)
groups=(base-devel)
depends=(ncurses perl sh musl)
source=("https://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('8eb753ed28bca21f8f56c1a180362aed789229bd62fff58bf8368e9beb59fec4')

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
