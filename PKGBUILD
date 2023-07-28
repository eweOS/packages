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
arch=(x86_64 aarch64 riscv64)
url="https://www.gnu.org/software/gdbm/gdbm.html"
license=(GPL3)
depends=(readline)
provides=(libgdbm_compat.so libgdbm.so)
source=("https://ftp.gnu.org/gnu/gdbm/$pkgname-$pkgver.tar.gz")
sha512sums=('918080cb0225b221c11eb7339634a95e00c526072395f7a3d46ccf42ef020dea7c4c5bec34aff2c4f16033e1fff6583252b7e978f68b8d7f8736b0e025838e10')

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
