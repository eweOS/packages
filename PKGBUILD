# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=nettle
pkgver=3.9.1
pkgrel=1
pkgdesc="A low-level cryptographic library"
arch=(x86_64 aarch64 riscv64)
url="https://www.lysator.liu.se/~nisse/nettle"
license=('GPL2')
depends=('gmp')
provides=('libnettle.so' 'libhogweed.so')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ccfeff981b0ca71bbd6fbcb054f407c60ffb644389a5be80d6716d5b550c6ce3')

prepare()
{
  cd $pkgname-$pkgver
  # disable static so there is no libnettle.a
  sed -i 's/ symbols-test//g' testsuite/Makefile.in
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-static
  make
}

check()
{
  cd $pkgname-$pkgver
  make -k check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
