# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-curl
pkgname=(lua51-curl lua54-curl)
_lvers=(5.1 5.4)
pkgver=0.3.13
pkgrel=1
pkgdesc=' Lua binding to libcurl.'
url='https://github.com/Lua-cURL/Lua-cURLv3'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(curl)
makedepends=(lua51 lua54)
source=("https://github.com/Lua-cURL/Lua-cURLv3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aba40511a7cac4422c0238d1db42b2124ea5a727b0745f7f434f3dc119cbb2db')

prepare() {
	for v in ${_lvers[*]}; do
		cp -rf Lua-cURLv3-$pkgver build-$v
	done
}

build () {
	for v in ${_lvers[*]}; do
		cd $srcdir/build-$v
		make LUA_IMPL=lua$v
	done
}

# missing lunit, skip for now
# check() {
#	cd lua-curl-$pkgver
# }

do_install() {
	v=$1
	depends+=(lua${v/./})

	cd $srcdir/build-$v
	make install LUA_IMPL=lua$v DESTDIR=$pkgdir
	_install_license_ LICENSE
}

package_lua51-curl() {
	do_install 5.1
}

package_lua54-curl() {
	do_install 5.4
}
