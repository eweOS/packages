# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Daurnimator <quae@daurnimator.com>

pkgname=libidn2
pkgver=2.3.4
pkgrel=1
pkgdesc="Free software implementation of IDNA2008, Punycode and TR46"
arch=(x86_64 aarch64)
url="https://www.gnu.org/software/libidn/#libidn2"
license=('GPL2' 'LGPL3')
depends=('libunistring')
provides=('libidn2.so')
source=(https://ftp.gnu.org/gnu/libidn/$pkgname-$pkgver.tar.gz)
sha512sums=('a6e90ccef56cfd0b37e3333ab3594bb3cec7ca42a138ca8c4f4ce142da208fa792f6c78ca00c01001c2bc02831abcbaf1cf9bcc346a5290fd7b30708f5a462f3')

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
