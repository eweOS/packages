# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Daurnimator <quae@daurnimator.com>

pkgname=libidn2
pkgver=2.3.3
pkgrel=1
pkgdesc="Free software implementation of IDNA2008, Punycode and TR46"
arch=(x86_64 aarch64)
url="https://www.gnu.org/software/libidn/#libidn2"
license=('GPL2' 'LGPL3')
depends=('libunistring')
provides=('libidn2.so')
source=(https://ftp.gnu.org/gnu/libidn/$pkgname-$pkgver.tar.gz)
sha512sums=('2dd0201b5224b3eb6a5667e53c9a2beb6e6aefefab23060a70f143bb5d447029e8f4200e4e0460a4fab51767f0bdfc9583a0cc757652bee58f5593106dd18274')

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
