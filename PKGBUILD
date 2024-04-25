# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libuargp
pkgver=0.1.1
pkgrel=1
pkgdesc="libuargp extracted from uclibc, modified lightly, intl-friendly"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/eweOS/libuargp"
license=(LGPL)
provides=(libargp.so)
source=("https://github.com/eweOS/libuargp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1623fe037e88886f02282519ec129c3b161ddf44662eef59a92139a02336ae61')

build()
{
	cd $pkgbase-$pkgver
	sed -i 's/prefix=\/usr\/local/prefix=\/usr/g' Makefile
	make
}

package()
{
  	cd $pkgbase-$pkgver
	make DESTDIR="$pkgdir" install
}
