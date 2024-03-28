pkgbase=lua-cjson
pkgname=(lua51-cjson lua54-cjson)
pkgver=2.1.0.13
pkgrel=1
pkgdesc='A fast JSON encoding/parsing module for Lua'
url='https://github.com/openresty/lua-cjson'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(lua51 lua54)
source=("https://github.com/openresty/lua-cjson/archive/refs/tags/$pkgver.tar.gz")
_lvers=(5.1 5.4)
sha256sums=('8af6aae85258f796d865073a1a451ab29502cae2e88ed89867af8448f2a7138c')

build () {
	for v in ${_lvers[*]}; do
		cd $srcdir
		cp -r lua-cjson-$pkgver build-$v
		cd build-$v
		make LUA_VERSION=$v				\
			PREFIX=/usr				\
			LUA_INCLUDE_DIR=/usr/include/lua$v
	done
}

_package() {
	v=$1
	cd build-$v
	make install LUA_VERSION=$v		\
			PREFIX=/usr		\
			DESTDIR=$pkgdir
	make install-extra LUA_VERSION=$v		\
			PREFIX=/usr			\
			DESTDIR=$pkgdir
	rm -r $pkgdir/usr/share/lua/$v/cjson/tests
	rm -r $pkgdir/usr/bin # TODO: package tools
	_install_license_ LICENSE
}

package_lua51-cjson() {
	depends=(lua51)
	_package 5.1
}

package_lua54-cjson() {
	depends=(lua54)
	_package 5.4
}
