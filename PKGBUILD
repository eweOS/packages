# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=(luarocks51 luarocks54)
pkgver=3.12.2
pkgrel=1
pkgdesc='The package manager for Lua modules.'
url='https://luarocks.org'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl base-devel)
makedepends=(lua51 lua54)
source=("https://luarocks.org/releases/luarocks-$pkgver.tar.gz")
sha256sums=('b0e0c85205841ddd7be485f53d6125766d18a81d226588d2366931e9a1484492')

luaver="5.1 5.4"

prepare() {
	for ver in $luaver
	do
		cp -rf luarocks-$pkgver $ver
	done
}

build () {
	for ver in $luaver
	do
		cd $srcdir/$ver
		./configure					\
			--lua-version=$ver			\
			--prefix=/usr				\
			--with-lua=/usr				\
			--with-lua-bin=/usr/bin			\
			--with-lua-include=/usr/include/lua$ver
		make
	done
}

_package() {
	cd 5.$1
	make install DESTDIR=${pkgdir}
	for file in ${pkgdir}/usr/bin/*
	do
		mv $file $file-5.$1
	done
	cat <<"---" >> $pkgdir/etc/luarocks/config-5.$1.lua
variables["CC"] = "clang"
variables["LD"] = "clang"
---
}

package_luarocks54() {
	depends+=(lua54)
	provides=(luarocks)
	_package 4
}

package_luarocks51() {
	depends+=(lua51)
	_package 1
}
