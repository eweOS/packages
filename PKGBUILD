# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libtg_owt
_commit=afd9d5d31798d3eacf9ed6c30601e91d0f1e4d60
_libyuv_commit=ec6f15079ff373b7651698a68bba7244b3556981
_crc32c_commit=02e65f4fd3065d27b2e29324800ca6d04df16126
_libsrtp_commit=a566a9cfcd619e8327784aa7cff4a1276dc1e895
pkgver=20231222.${_commit:0:7}
pkgrel=2
pkgdesc="Telegram's fork of WebRTC"
url='https://github.com/desktop-app/tg_owt'
arch=(x86_64 aarch64)
license=(BSD-3-Clause)
depends=(abseil-cpp ffmpeg libjpeg openssl openh264 libopus libvpx)
makedepends=(cmake git yasm)
source=("$url/archive/$_commit.tar.gz"
	"https://chromium.googlesource.com/libyuv/libyuv/+archive/$_libyuv_commit.tar.gz"
	"https://github.com/google/crc32c/archive/$_crc32c_commit.tar.gz"
	"https://github.com/cisco/libsrtp/archive/$_libsrtp_commit.tar.gz"
	"fix-for-ffmpeg7.patch")
noextract=($_libyuv_commit.tar.gz)
sha256sums=('74c3da125d35de433909a31c6d2a65455e72c68c052b6a25b16af2aa5c24123a'
            'SKIP'
            '50ac512ad20ebca0be21bcf7c3c6d15aa3fcc27550b09825fab061bffe512bdf'
            'e9ea6288246f3cb21954393a19fda09f4dd252147967a30bb8824c2168620c61'
            '2146a34d3e86baff0820d19faf4da6389bd53b7fc1411ef5a48a7980cda57459')

prepare() {
	mkdir -p libyuv
	tar xf $_libyuv_commit.tar.gz -C libyuv
	_patch_ tg_owt-$_commit
	cd tg_owt-$_commit
	sed -ie 's/include(cmake\/libabsl.cmake)//' CMakeLists.txt
	mv $srcdir/libyuv/* src/third_party/libyuv/
	mv $srcdir/crc32c-$_crc32c_commit/* src/third_party/crc32c/src
	mv $srcdir/libsrtp-$_libsrtp_commit/* src/third_party/libsrtp
}

build () {
	cmake -B build -S tg_owt-$_commit \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=Release		\
		-DTG_OWT_USE_PIPEWIRE=OFF		\
		-DTG_OWT_USE_X11=OFF
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ tg_owt-$_commit/LICENSE
}

