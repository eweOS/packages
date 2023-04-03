# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libffi
pkgver=3.4.3
pkgrel=2
pkgdesc='A portable Foregin Function Interface library.'
arch=(x86_64 aarch64)
url='http://sourceware.org/libffi/'
license=(BSD)
source=(
  "ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz"
)
sha256sums=('4416dd92b6ae8fcb5b10421e711c4d3cb31203d77521a77d85d0102311e6c3b8')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-shared
  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
