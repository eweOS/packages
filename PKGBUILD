# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=libnl
pkgver=3.10.0
pkgrel=1
pkgdesc='Library for applications dealing with netlink sockets'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('musl' 'flex' 'bison')
makedepends=('linux-headers')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('49b3e2235fdb58f5910bbb3ed0de8143b71ffc220571540502eb6c2471f204f5')

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
