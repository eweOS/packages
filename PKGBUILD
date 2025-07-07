# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=nettle
pkgver=3.10.2
pkgrel=1
pkgdesc="A low-level cryptographic library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.lysator.liu.se/~nisse/nettle"
license=('GPL2')
depends=('gmp')
provides=('libnettle.so' 'libhogweed.so')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5')

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
