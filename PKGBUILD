# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libuargp
pkgver=0.1.0
pkgrel=1
pkgdesc="libuargp extracted from uclibc, modified lightly, intl-friendly"
arch=(x86_64 aarch64)
url="https://github.com/xhebox/libuargp"
license=(LGPL)
source=(https://github.com/xhebox/libuargp/archive/refs/heads/master.tar.gz)
sha256sums=('SKIP')

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
