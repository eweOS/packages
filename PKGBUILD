# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=libnl
pkgver=3.8.0
pkgrel=1
pkgdesc='Library for applications dealing with netlink sockets'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('musl' 'flex' 'bison')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bb726c6d7a08b121978d73ff98425bf313fa26a27a331d465e4f1d7ec5b838c6')

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
