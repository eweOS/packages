# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=wesnoth
pkgver=1.19.14
pkgrel=1
pkgdesc='An open source, turn-based strategy game with a high fantasy theme'
url='https://www.wesnoth.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl boost-libs sdl2 sdl2-image sdl2-mixer fontconfig cairo pango
	 libvorbis libbz2 zlib-ng openssl curl dbus readline gettext-tiny
	 lua54)
makedepends=(cmake ninja boost)
# Disable LTO for now due to clang's bug
#	https://github.com/llvm/llvm-project/issues/116950
# which leads to a broken order of static objects' initialization when LTO
# is enabled.
options=(!lto)
# 0001: Downstream, ensure Lua headers are included as C-style ones to avoid
#	undefined references caused by unnecessary mangling.
source=("https://github.com/wesnoth/wesnoth/archive/refs/tags/$pkgver.tar.gz"
	0001-include-cppstyle-lua-header.patch)
sha256sums=('d5e34c44938f37bb91905f966dfb082c8c67a837726260951089b194bceb2312'
            'ac06bfc735ae4e6577b77f2d06560aea78d5358bbfc2c5a30a334b1ada434812')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	cmake -S "$pkgname-$pkgver" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DENABLE_GAME=ON			\
		-DENABLE_SERVER=ON			\
		-DENABLE_NLS=ON				\
							\
		-DENABLE_SYSTEM_LUA=ON			\
		-DLUA_INCLUDE_DIR=/usr/include/lua5.4	\
		-DLUA_LIBRARY=/usr/lib/liblua-5.4.so

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	rm -r "$pkgdir/var"
}
