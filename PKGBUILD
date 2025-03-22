# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Daurnimator <quae@daurnimator.com>

pkgname=libidn2
pkgver=2.3.8
pkgrel=1
pkgdesc="Free software implementation of IDNA2008, Punycode and TR46"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/libidn/#libidn2"
license=('GPL2' 'LGPL3')
depends=('libunistring')
provides=('libidn2.so')
source=(https://ftp.gnu.org/gnu/libidn/$pkgname-$pkgver.tar.gz)
sha512sums=('4d8427c0f115268132f7544e80a808c883ab1406338f6c529b1a586b016d57aedb0857f66166eb8d9f37d70efc9dccf907b673b43b17bcf258c8797db1e829ce')

prepare()
{
  cd $pkgname-$pkgver
}

build()
{
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check()
{
  cd $pkgname-$pkgver
  make check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
