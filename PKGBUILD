# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: muflax <muflax@gmail.com>
# Contributor: Adrian Siekierka <kontakt@asie.pl>

pkgname=robotfindskitten
pkgver=2.8284271.702
pkgrel=1
pkgdesc='Yet another Zen simulation'
arch=(x86_64 aarch64)
url='http://robotfindskitten.org/' # no https available
license=(GPL2)
depends=(ncurses)
source=("https://master.dl.sourceforge.net/project/rfk/robotfindskitten-POSIX/ship_it_anyway/robotfindskitten-2.8284271.702.tar.gz")
sha512sums=('SKIP')

prepare()
{
  cd $pkgname-$pkgver
  sed -i 's/execgamesdir = $(prefix)\/games/execgamesdir = $(prefix)\/bin/' src/Makefile.in
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package()
{
  make -C $pkgname-$pkgver prefix="$pkgdir/usr" install
  install -Dm644 $pkgname-$pkgver/nki/vanilla.nki \
    "$pkgdir/usr/share/games/robotfindskitten/vanilla.nki"
}
