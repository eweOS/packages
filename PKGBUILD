# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=libnl
pkgver=3.12.0
pkgrel=2
pkgdesc='Library for applications dealing with netlink sockets'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('musl' 'flex' 'bison')
makedepends=('linux-headers')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fc51ca7196f1a3f5fdf6ffd3864b50f4f9c02333be28be4eeca057e103c0dd18')

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
