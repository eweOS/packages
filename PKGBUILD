basename=lua-compat53
pkgname=lua51-compat53
pkgver=0.14.4
pkgrel=1
pkgdesc='Compatbility module providing Lua-5.3-style APIs for Lua'
url='https://github.com/lunarmodules/lua-compat-5.3'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(lua51)
makedepends=(luarocks51)
source=("https://github.com/lunarmodules/lua-compat-5.3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a9afa2eb812996039a05c5101067e6a31af9a75eded998937a1ce814afe1b150')

build() {
	cd lua-compat-5.3-$pkgver
	luarocks-5.1 make rockspecs/compat53-"$pkgver"-1.rockspec \
		--tree=./build
}

package() {
	cd lua-compat-5.3-$pkgver
	rm -r build/lib/luarocks
	mv build $pkgdir/usr

	inc=$pkgdir/usr/include/lua5.1
	install -Dm644 lprefix.h -t $inc
	install -Dm644 c-api/* -t $inc/c-api/

	_install_license_ LICENSE
}
