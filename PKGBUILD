basename=lua-compat53
pkgname=lua51-compat53
pkgver=0.13
pkgrel=1
pkgdesc='Compatbility module providing Lua-5.3-style APIs for Lua'
url='https://github.com/lunarmodules/lua-compat-5.3'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(lua51)
makedepends=(luarocks51)
source=("https://github.com/lunarmodules/lua-compat-5.3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5dc30e7b1fda856ee4d392be457642c1f0c259264a9b9bfbcb680302ce88fc2')

build() {
	cd lua-compat-5.3-$pkgver
	luarocks-51 make rockspecs/compat53-scm-0.rockspec	\
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
