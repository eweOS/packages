# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=gdbm
pkgver=1.23
pkgrel=1
pkgdesc="GNU database library"
arch=(x86_64 aarch64)
url="https://www.gnu.org/software/gdbm/gdbm.html"
license=(GPL3)
depends=(readline)
provides=(libgdbm_compat.so libgdbm.so)
source=("https://ftp.gnu.org/gnu/gdbm/$pkgname-$pkgver.tar.gz")
sha512sums=('SKIP')

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
