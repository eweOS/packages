# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=libnl
pkgver=3.11.0
pkgrel=1
pkgdesc='Library for applications dealing with netlink sockets'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('musl' 'flex' 'bison')
makedepends=('linux-headers')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2a56e1edefa3e68a7c00879496736fdbf62fc94ed3232c0baba127ecfa76874d')

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
