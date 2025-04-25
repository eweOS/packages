# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libtg_owt
_commit=be39b8c8d0db1f377118f813f0c4bd331d341d5e
_libyuv_commit=ec6f15079ff373b7651698a68bba7244b3556981
_crc32c_commit=02e65f4fd3065d27b2e29324800ca6d04df16126
pkgver=r20241203.${_commit:0:7}
pkgrel=3
pkgdesc="Telegram's fork of WebRTC"
url='https://github.com/desktop-app/tg_owt'
arch=(x86_64 aarch64)
license=(BSD-3-Clause)
depends=(abseil-cpp ffmpeg libjpeg openssl openh264 libopus libpipewire libvpx
	 libsrtp)
makedepends=(cmake git yasm linux-headers python)
source=("$url/archive/$_commit.tar.gz"
	"git+https://gitlab.com/chromiumsrc/libyuv.git#commit=$_libyuv_commit"
	"https://github.com/google/crc32c/archive/$_crc32c_commit.tar.gz"
	"use-libopengl.patch")
sha256sums=('b17301264d43272e7033b5434617ed9376020da9c4d118b16e0c3fcde2c89e03'
            '8e42db1f3e308c3baefc7c2c1368f29af12650f75305b4a2e2c0ea6fa00d21bc'
            '50ac512ad20ebca0be21bcf7c3c6d15aa3fcc27550b09825fab061bffe512bdf'
            'f49cfdb50f5ca0cd7692a43287fd8396e59eeb438a509cce8afd3438736d136b')

prepare() {
	_patch_ tg_owt-$_commit

	cd tg_owt-$_commit
	sed -i 's/include(cmake\/libabsl.cmake)//' CMakeLists.txt

	mv $srcdir/libyuv/* src/third_party/libyuv
	mv $srcdir/crc32c-$_crc32c_commit/* src/third_party/crc32c/src
}

build () {
	cmake -B build -S tg_owt-$_commit \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=Release		\
		-DTG_OWT_PACKAGED_BUILD=ON		\
		-DTG_OWT_USE_PIPEWIRE=ON		\
		-DTG_OWT_USE_X11=OFF
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ tg_owt-$_commit/LICENSE
}

