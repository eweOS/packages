# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=luarocks
pkgname=(luarocks51 luarocks54 luarocks55)
pkgver=3.13.0
pkgrel=2
pkgdesc='The package manager for Lua modules.'
url='https://luarocks.org'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl base-devel)
makedepends=(lua51 lua54 lua55 lua51-compat53)
# 0001: Downstream, skip installation of vendored compat53. Use the
#	eweOS-shipped package instead.
source=("https://luarocks.org/releases/luarocks-$pkgver.tar.gz"
	0001-luarocks51-do-not-install-vendored-compat53.patch)
sha256sums=('245bf6ec560c042cb8948e3d661189292587c5949104677f1eecddc54dbe7e37'
            '447f5f588679e02dfe832476c26c6b0e2e2624c035736d3d5b6e9bb6c7b5edba')

luaver="5.1 5.4 5.5"

prepare() {
	for ver in $luaver
	do
		cp -rf luarocks-$pkgver $ver
		_patch_ $ver
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

package_luarocks55() {
	depends+=(lua55)
	provides=(luarocks)
	_package 5
}

package_luarocks54() {
	depends+=(lua54)
	provides=(luarocks)
	_package 4
}

package_luarocks51() {
	depends+=(lua51 lua51-compat53)
	_package 1
}
