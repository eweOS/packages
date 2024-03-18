# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=libnl
pkgver=3.9.0
pkgrel=1
pkgdesc='Library for applications dealing with netlink sockets'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('musl' 'flex' 'bison')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb')

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
