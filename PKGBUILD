# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=gmp
pkgver=6.3.0
pkgrel=3
pkgdesc='A free library for arbitrary precision arithmetic'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://gmplib.org/'
license=(LGPL3 GPL)
makedepends=(autoconf)
source=(https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz
	fix-loongarch64-int128.patch)
sha256sums=('be5c908a7a836c3a9bd9d62aa58563c5e9e7fef94c43a7f42dbc35bb6d02733c'
	    '3f254359e09eb23423c7019bbdca7d08d407f261562bdb9f8030cca96df91f60')

prepare()
{
  cd $pkgname-$pkgver
  _patch_ $pkgname-$pkgver
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
