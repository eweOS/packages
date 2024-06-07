# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=(luarocks51 luarocks54)
pkgver=3.11.1
pkgrel=1
pkgdesc='The package manager for Lua modules.'
url='https://luarocks.org'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl base-devel)
makedepends=(lua51 lua54)
source=("https://luarocks.org/releases/luarocks-$pkgver.tar.gz")
sha256sums=('c3fb3d960dffb2b2fe9de7e3cb004dc4d0b34bb3d342578af84f84325c669102')

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
		mv $file $file-5$1
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
