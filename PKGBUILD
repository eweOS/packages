# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=minetest
pkgver=5.9.1
pkgrel=1
pkgdesc='An open source voxel game-creation platform with easy modding and game creation'
url='https://www.minetest.net/'
arch=(x86_64 aarch64)	# limited by LuaJIT
license=(LGPL-2.1-or-later CC-BY-SA-3.0 CC-BY-SA-4.0 Apache-2.0 MIT
	 BSD-3-Clause)
depends=(libjpeg libpng sdl2 freetype2 sqlite zlib zstd luajit gmp jsoncpp
	 curl gettext ncurses openal-soft libogg libvorbis)
# missing doxygen
makedepends=(cmake)
source=("https://github.com/minetest/minetest/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aa9a6ae57445b779f57dcba5a83b0704fabd24c5eca37c6c8611e885bdf09d7c')

build () {
	# disabled features:
	#	various db-based map backend
	# 	OpenGL (not ES) support
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_CLIENT=TRUE			\
		-DBUILD_SERVER=TRUE			\
		-DBUILD_UNITTESTS=FALSE			\
		-DBUILD_BENCHMARKS=FALSE		\
		-DBUILD_DOCUMENTATION=FALSE		\
		-DPRECOMPILE_HEADERS=FALSE		\
		-DUSE_SDL2=TRUE				\
		-DENABLE_CURL=ON			\
		-DENABLE_CURSES=ON			\
		-DENABLE_GETTEXT=ON			\
		-DENABLE_LEVELDB=OFF			\
		-DENABLE_POSTGRESQL=OFF			\
		-DENABLE_REDIS=OFF			\
		-DENABLE_SPATIAL=OFF			\
		-DENABLE_SOUND=ON			\
		-DENABLE_LTO=Thin			\
		-DENABLE_LUAJIT=ON			\
		-DENABLE_PROMETHEUS=OFF			\
		-DENABLE_SYSTEM_GMP=ON			\
		-DENABLE_SYSTEM_JSONCPP=ON		\
		-DRUN_IN_PLACE=FALSE			\
		-DENABLE_UPDATE_CHECKER=FALSE		\
		-DENABLE_GLES1=ON			\
		-DENABLE_GLES2=ON			\
		-DENABLE_OPENGL=OFF			\
		-DINSTALL_DEVTEST=FALSE			\
		-DUSE_GPROF=FALSE			\
		-DBUILD_WITH_TRACY=FALSE

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	mkdir -p "$pkgdir"/usr/share/licenses/minetest
	install -Dm644 "$pkgname-$pkgver"/{COPYING.LESSER,LICENSE.txt} \
		"$pkgdir"/usr/share/licenses/minetest
}
