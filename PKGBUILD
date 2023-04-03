# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=libnl
pkgver=3.7.0
pkgrel=1
pkgdesc='Library for applications dealing with netlink sockets'
arch=(x86_64 aarch64)
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('musl' 'flex' 'bison')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939')

build()
{
  cd $pkgname-$pkgver
  CFLAGS=""
  autoreconf
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static
  make
}

package()
{
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
