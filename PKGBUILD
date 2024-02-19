# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Daurnimator <quae@daurnimator.com>

pkgname=libidn2
pkgver=2.3.7
pkgrel=1
pkgdesc="Free software implementation of IDNA2008, Punycode and TR46"
arch=(x86_64 aarch64 riscv64)
url="https://www.gnu.org/software/libidn/#libidn2"
license=('GPL2' 'LGPL3')
depends=('libunistring')
provides=('libidn2.so')
source=(https://ftp.gnu.org/gnu/libidn/$pkgname-$pkgver.tar.gz)
sha512sums=('eab5702bc0baed45492f8dde43a4d2ea3560ad80645e5f9e0cfa8d3b57bccd7fd782d04638e000ba07924a5d9f85e760095b55189188c4017b94705bef9b4a66')

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
