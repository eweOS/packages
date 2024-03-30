# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-lpeg
pkgname=(lua51-lpeg lua54-lpeg)
pkgver=1.0.2
pkgrel=1
pkgdesc='Pattern-matching library for Lua'
url='http://www.inf.puc-rio.br/~roberto/lpeg'
arch=(x86_64 aarch64 riscv64)
makedepends=(lua51 lua54)
license=(MIT)
source=("http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-$pkgver.tar.gz")
_lvers=(5.1 5.4)
sha256sums=('48d66576051b6c78388faad09b70493093264588fcd0f258ddaab1cdd4a15ffe')

build() {
	for v in ${_lvers[*]}; do
		cd $srcdir
		cp -rf lpeg-$pkgver build-$v
		cd build-$v
		make linux LUADIR=/usr/include/lua$v
	done
}

check() {
	for v in ${_lvers[*]}; do
		cd $srcdir/build-$v
		lua$v test.lua
	done
}

do_package() {
	v=$1
	install -Dm755 build-$v/lpeg.so $pkgdir/usr/lib/lua/$v/lpeg.so
	_install_license_ build-$v/lpeg.html
}

package_lua51-lpeg() {
	depends=(lua51)
	do_package 5.1
}

package_lua54-lpeg() {
	depends=(lua54)
	do_package 5.4
}
