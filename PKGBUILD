# Maintainer: Yao Zi <me@ziyao.cc>
basename=lua-posix
# TODO: Package it for Lua 5.1, missing bit32
pkgname=(lua54-posix lua55-posix)
pkgver=37.0
pkgrel=2
pkgdesc='Lua bindings for POSIX APIs'
url='https://luaposix.github.io/luaposix/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(luarocks54 luarocks55)
source=("https://github.com/luaposix/luaposix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a0cf9fc9459ae0975afd1e24ea552decfcda2231651a0d3bd6e1f075e089e01')

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
