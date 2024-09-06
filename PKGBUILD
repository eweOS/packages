# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libtg_owt
_commit=dc17143230b5519f3c1a8da0079e00566bd4c5a8
_libyuv_commit=ec6f15079ff373b7651698a68bba7244b3556981
_crc32c_commit=02e65f4fd3065d27b2e29324800ca6d04df16126
pkgver=r20240804.${_commit:0:7}
pkgrel=2
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
	"use-libopengl.patch"
	"fix-for-ffmpeg7.patch"
	"unbundle-libsrtp.patch")
sha256sums=('f1ca8f664b71e3c17a5cc87404dd9275eefac030247017eb41d09c7b19571617'
            '8e42db1f3e308c3baefc7c2c1368f29af12650f75305b4a2e2c0ea6fa00d21bc'
            '50ac512ad20ebca0be21bcf7c3c6d15aa3fcc27550b09825fab061bffe512bdf'
            'f49cfdb50f5ca0cd7692a43287fd8396e59eeb438a509cce8afd3438736d136b'
            '2146a34d3e86baff0820d19faf4da6389bd53b7fc1411ef5a48a7980cda57459'
            'b2f07e74fb86da1ebef419d54151d9b14c3dc7eb03c5909f73f95094766f2e2c')

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

