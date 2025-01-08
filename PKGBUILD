# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=nettle
pkgver=3.10.1
pkgrel=1
pkgdesc="A low-level cryptographic library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.lysator.liu.se/~nisse/nettle"
license=('GPL2')
depends=('gmp')
provides=('libnettle.so' 'libhogweed.so')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b0fcdd7fc0cdea6e80dcf1dd85ba794af0d5b4a57e26397eee3bc193272d9132')

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
