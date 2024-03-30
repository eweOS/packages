# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-luv
pkgname=(lua51-luv lua54-luv libluv)
pkgver=1.48.0.2
_pkgver=1.48.0-2
pkgrel=1
pkgdesc='Bare livuv bindings for Lua'
url='https://github.com/luvit/luv'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(libuv)
makedepends=(lua51-compat53 cmake)
source=("https://github.com/luvit/luv/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('e64cd8a0197449288b37df6ca058120e8d2308fc305f543162b5bf3e92273a05')

_lvers=(5.1 5.4)

build() {
	for v in ${_lvers[*]}; do
		echo $v
		cmake -B build-$v \
			-DCMAKE_INSTALL_PREFIX=/usr		\
			-DWITH_LUA_ENGINE=Lua			\
			-DWITH_SHARED_LIBUV=ON			\
			-DLUA_BUILD_TYPE=System			\
			-DLUA=lua$v				\
			-DLUA_INCDIR=/usr/include/lua$v		\
			-DLUA_LIBDIR=/usr/lib/lua$v		\
			-DLUADIR=/usr/share/lua/$v		\
			-DLIBDIR=/usr/lib/lua/$v		\
			-DLUA_COMPAT53_DIR=/usr/include/lua$v	\
			-DBUILD_MODULE=ON			\
			-DBUILD_STATIC_LIBS=OFF			\
			-DBUILD_SHARED_LIBS=OFF luv-$_pkgver
		cmake --build build-$v
	done

	cmake -B build-libluv \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DWITH_LUA_ENGINE=Lua			\
		-DWITH_SHARED_LIBUV=ON			\
		-DLUA=lua5.1				\
		-DLUA_INCDIR=/usr/include/lua5.1	\
		-DLUA_LIBDIR=/usr/lib/lua5.1		\
		-DLUA_COMPAT53_DIR=/usr/include/lua5.1	\
		-DLUA_BUILD_TYPE=System			\
		-DBUILD_MODULE=OFF			\
		-DBUILD_STATIC_LIBS=OFF			\
		-DBUILD_SHARED_LIBS=ON luv-$_pkgver

	cmake --build build-libluv
}

check() {
	cd luv-$_pkgver
	for v in ${_lvers[*]}; do
		LUA_CPATH="$srcdir/build-$v/?.so;;"	\
			lua$v tests/run.lua
	done
}

do_package() {
	v=$1
	DESTDIR=$pkgdir cmake --install build-$v
	_install_license_ luv-$_pkgver/LICENSE.txt
}

package_lua51-luv() {
	depends=(libuv lua51)
	do_package 5.1
}

package_lua54-luv() {
	depends=(libuv lua54)
	do_package 5.4
}

package_libluv() {
	depends=(libuv)
	DESTDIR=$pkgdir cmake --install build-libluv
}
