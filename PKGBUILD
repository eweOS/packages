# Maintainer: Yao Zi <me@ziyao.cc>
basename=lua-posix
# TODO: Package it for Lua 5.1, missing bit32
pkgname=(lua54-posix lua55-posix)
pkgver=39
pkgrel=1
pkgdesc='Lua bindings for POSIX APIs'
url='https://luaposix.github.io/luaposix/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(luarocks54 luarocks55)
source=("https://github.com/luaposix/luaposix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4b7adce5bae6f02523bc6efb6e0c778a2f42cd555f48391f8c8c070f6f408709')

do_package() {
	v=$1

	cd luaposix-$pkgver
	luarocks-$v make luaposix-$pkgver-1.rockspec --tree="$pkgdir/usr" \
		--deps-mode=none --no-manifest

	_install_license_ LICENSE
}

package_lua54-posix(){
	depends+=(lua54)

	do_package 5.4
}

package_lua55-posix(){
	depends+=(lua55)

	do_package 5.5
}
