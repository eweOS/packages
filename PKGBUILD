# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-cjson
pkgname=(lua51-cjson lua54-cjson lua55-cjson)
pkgver=2.1.0.19
pkgrel=2
pkgdesc='A fast JSON encoding/parsing module for Lua'
url='https://github.com/openresty/lua-cjson'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
makedepends=(lua51 lua54 lua55)
checkdepends=(perl)
source=("https://github.com/openresty/lua-cjson/archive/refs/tags/$pkgver.tar.gz")
_lvers=(5.1 5.4 5.5)
sha256sums=('d1aded44b4cfe5ec6b395e178902aba3eed1dbe7999a753c0662222de2890ec0')

build () {
	for v in ${_lvers[*]}; do
		cd "$srcdir"
		cp -r lua-cjson-$pkgver build-$v
		cd build-$v
		make LUA_VERSION=$v				\
			PREFIX=/usr				\
			LUA_INCLUDE_DIR=/usr/include/lua$v
	done
}

check() {
	# Check fails for 5.5, where table.unpack({nil, true}) returns nothing.
	# https://github.com/mpx/lua-cjson/issues/98
	# https://github.com/openresty/lua-cjson/issues/120
	# We might backport https://github.com/openresty/lua-cjson/pull/123
	# later to fix this up, but it doesn't seem worth now.
	for v in 5.1 5.4; do
		msg2 "Running tests with Lua $v"

		cd "$srcdir"/build-$v/tests
		perl ./genutf8.pl
		LUA_CPATH="$PWD/../?.so" LUA_PATH="$PWD/../lua/?.lua" \
			lua$v test.lua | grep Test
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
			DESTDIR="$pkgdir"
	rm -r "$pkgdir"/usr/share/lua/$v/cjson/tests
	rm -r "$pkgdir"/usr/bin # TODO: package tools
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

package_lua55-cjson() {
	depends=(lua55)
	_package 5.5
}
