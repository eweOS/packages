# Maintainer: Yao Zi <me@ziyao.cc>
basename=lua-posix
# TODO: Package it for Lua 5.1, missing bit32
pkgname=(lua54-posix)
pkgver=36.3
pkgrel=1
pkgdesc='Lua bindings for POSIX APIs'
url='https://luaposix.github.io/luaposix/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(luarocks54)
source=("https://github.com/luaposix/luaposix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82cd9a96c41a4a3205c050206f0564ff4456f773a8f9ffc9235ff8f1907ca5e6')

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
