# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=gmp
pkgver=6.3.0
pkgrel=2
pkgdesc='A free library for arbitrary precision arithmetic'
arch=(x86_64 aarch64 riscv64)
url='https://gmplib.org/'
license=(LGPL3 GPL)
makedepends=(autoconf)
source=(https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz)
md5sums=('db3f4050677df3ff2bd23422c0d3caa1')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  cd $pkgname-$pkgver
  CC=cc ./configure --build=${CHOST} \
    --prefix=/usr \
    --enable-cxx \
    --enable-fat
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
  make DESTDIR="${pkgdir}" install
}
