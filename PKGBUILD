# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libuargp
pkgver=0.1.0
pkgrel=2
pkgdesc="libuargp extracted from uclibc, modified lightly, intl-friendly"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/xhebox/libuargp"
license=(LGPL)
provides=(libargp.so)
source=(https://github.com/xhebox/libuargp/archive/refs/heads/master.tar.gz
	fix-headers.patch)
sha256sums=('84f3472a4931dfbd713a699b60896aac4e318a9032d39036a7ce78860e056fe2'
	    'bb800afaf5644023d076d76fc778b83da2771d6892e63eb9dfd1f1da6d3865c1')

prepare() {
  cd $pkgbase-master
  patch -p1 < $srcdir/fix-headers.patch
}

build()
{
  cd $pkgbase-master
  sed -i 's/prefix=\/usr\/local/prefix=\/usr/g' Makefile
  make
}

package()
{
  cd $pkgbase-master
  make DESTDIR="$pkgdir" install
}
