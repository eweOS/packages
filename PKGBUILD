# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=('luanti' 'luanti-server' 'luanti-common')
pkgver=5.12.0
pkgrel=1
pkgdesc='An open source voxel game-creation platform with easy modding and game creation'
url='https://www.minetest.net/'
arch=(x86_64 aarch64)	# limited by LuaJIT
license=(LGPL-2.1-or-later CC-BY-SA-3.0 CC-BY-SA-4.0 Apache-2.0 MIT
	 BSD-3-Clause)
# missing doxygen
makedepends=(
  libjpeg libpng sdl2 freetype2 spatialindex sqlite zlib zstd luajit gmp jsoncpp
  curl gettext ncurses openal-soft libogg libvorbis
  cmake ninja
)
source=(
  "https://github.com/luanti-org/luanti/archive/refs/tags/$pkgver.tar.gz"
  luanti.service
  luanti.sysusers
  luanti.tmpfiles
)
sha256sums=('876867ac874492f20968f2c2eb4e403231e8e9f29e0e06efa512200bd5152355'
            '8ca438d65bc4557d9ab6e16752d55fe41582c2aedd0fcbdd97effa5fd114601c'
            '294283b0686c4d73d816168544ab2f813a7a0ca63fc49da59563a329dd329eed'
            'c9a0c78a49461f56381e5615045d036cd594b741c910129eccf43e475c40cca1')

prepare() {
  install -d build-{client,server}
}

build () {
	# disabled features:
	#	various db-based map backend
	# 	OpenGL (not ES) support (for client only)

  _cmake_options=(
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_UNITTESTS=FALSE
    -DBUILD_BENCHMARKS=FALSE
    -DBUILD_DOCUMENTATION=FALSE
    -DBUILD_WITH_TRACY=FALSE
    -DPRECOMPILE_HEADERS=FALSE
    -DUSE_SDL2=TRUE
    -DUSE_GPROF=FALSE
    -DENABLE_LTO=Thin
    -DENABLE_CURL=ON
    -DENABLE_CURSES=ON
    -DENABLE_SOUND=ON
    -DENABLE_LUAJIT=ON
    -DENABLE_SPATIAL=ON
    -DENABLE_SYSTEM_GMP=ON
    -DENABLE_SYSTEM_JSONCPP=ON
    -DENABLE_PROMETHEUS=OFF
    -DENABLE_REDIS=OFF
    -DENABLE_POSTGRESQL=OFF
    -DENABLE_LEVELDB=OFF
    -DENABLE_UPDATE_CHECKER=FALSE
    -DRUN_IN_PLACE=FALSE
    -DINSTALL_DEVTEST=FALSE
  )

  cmake -G Ninja -S "luanti-$pkgver" -B build-client \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_CLIENT=ON \
    -DENABLE_GETTEXT=ON \
    ${_cmake_options[@]} \
    -DENABLE_GLES2=ON \
    -DENABLE_OPENGL=OFF
  cmake --build build-client

  cmake -G Ninja -S "luanti-$pkgver" -B build-server \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_CLIENT=OFF \
    -DBUILD_SERVER=ON \
    ${_cmake_options[@]}
  cmake --build build-server
}

package_luanti() {
  pkgdesc='Multiplayer infinite-world block sandbox game'
  depends=('luanti-common' 'curl' 'libvorbis' 'sqlite'
           'openal' 'hicolor-icon-theme' 'desktop-file-utils' 'xdg-utils'
           'freetype2' 'luajit' 'spatialindex' 'jsoncpp'
           'libgl' 'libjpeg-turbo' 'sdl2' 'gmp') # irrlichtmt
  conflicts=('minetest')
  replaces=('minetest')

  DESTDIR="$pkgdir" cmake --install build-client

  rm -rf "$pkgdir"/usr/share/{luanti,doc}
  rm "$pkgdir"/usr/share/man/man6/luantiserver.6
}

package_luanti-server() {
  pkgdesc='Server of infinite-world block sandbox game'
  depends=('luanti-common' 'curl' 'sqlite' 'luajit'
           'spatialindex' 'jsoncpp' 'gmp')
  conflicts=('minetest-server')
  replaces=('minetest-server')

  DESTDIR="$pkgdir" cmake --install build-server
  install -d  "$pkgdir"/etc/luanti

  rm -rf "$pkgdir"/usr/share/{luanti,metainfo,appdata,applications,icons,doc}
  mv "$pkgdir"/usr/share/man/man6/luanti.6 "$pkgdir"/usr/share/man/man6/luantiserver.6

  _dinit_install_services_ "$srcdir"/luanti.service
  _install_tmpfiles_ "$srcdir"/luanti.tmpfiles
  _install_sysusers_ "$srcdir"/luanti.sysusers
}

package_luanti-common() {
  pkgdesc='Common data files for luanti and luanti-server'
  license=('custom')
  conflicts=('minetest-common')
  replaces=('minetest-common')

  cd "luanti-$pkgver"
  install -d "$pkgdir"/usr/share/luanti

  cp -r builtin client fonts textures "$pkgdir"/usr/share/luanti/
  cp -r "$srcdir"/build-client/locale "$pkgdir"/usr/share/luanti/

  for file in doc/{fst_api,lua_api,menu_lua_api,protocol,world_format}.*; do
    install -Dm644 $file "$pkgdir"/usr/share/luanti/doc/$(basename $file)
  done

  _install_license_ LICENSE.txt
}
