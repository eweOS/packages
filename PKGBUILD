# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=robotfindskitten
pkgver=2.8284271.702
pkgrel=3
pkgdesc='Yet another Zen simulation'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://robotfindskitten.org/' # no https available
license=(GPL2)
depends=(ncurses)
makedepends=(autoconf)
source=("https://master.dl.sourceforge.net/project/rfk/robotfindskitten-POSIX/ship_it_anyway/robotfindskitten-2.8284271.702.tar.gz")
sha512sums=('acc24996639f64cacc2e4d3389988deed693e457ab37b4e730f8a5a1b828e5f4f3a784e8071ed57d6dc7e6e1ea6ee8cbd2ea8c1d9115edb9cb909af044532db5')

prepare()
{
  cd $pkgname-$pkgver
  sed -i 's/execgamesdir = $(prefix)\/games/execgamesdir = $(prefix)\/bin/' src/Makefile.in
  autoreconf -fiv
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
