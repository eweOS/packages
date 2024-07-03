# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=gdbm
pkgver=1.24
pkgrel=1
pkgdesc="GNU database library"
arch=(x86_64 aarch64 riscv64)
url="https://www.gnu.org/software/gdbm/gdbm.html"
license=(GPL3)
depends=(readline)
provides=(libgdbm_compat.so libgdbm.so)
source=("https://ftp.gnu.org/gnu/gdbm/$pkgname-$pkgver.tar.gz")
sha512sums=('401ff8c707079f21da1ac1d6f4714a87f224b6f41943078487dc891be49f51fd1ac7a32fd599aae0fad185f2c6ba7432616d328fd6aaab068eb54db9562ff7fa')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --enable-libgdbm-compat
  make
}

check()
{
  make check -C $pkgname-$pkgver
}

package()
{
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{NOTE-WARNING,AUTHORS,NEWS,README,ChangeLog} -t "$pkgdir/usr/share/doc/$pkgname"
}
