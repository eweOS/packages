# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libtg_owt
_commit=c9cc4390ab951f2cbc103ff783a11f398b27660b
_libyuv_commit=ec6f15079ff373b7651698a68bba7244b3556981
_crc32c_commit=02e65f4fd3065d27b2e29324800ca6d04df16126
_libsrtp_commit=a566a9cfcd619e8327784aa7cff4a1276dc1e895
pkgver=r20240615.${_commit:0:7}
pkgrel=1
pkgdesc="Telegram's fork of WebRTC"
url='https://github.com/desktop-app/tg_owt'
arch=(x86_64 aarch64)
license=(BSD-3-Clause)
depends=(abseil-cpp ffmpeg libjpeg openssl openh264 libopus libvpx)
makedepends=(cmake git yasm linux-headers)
source=("$url/archive/$_commit.tar.gz"
	"https://gitlab.com/chromiumsrc/libyuv/-/archive/$_libyuv_commit.tar.gz"
	"https://github.com/google/crc32c/archive/$_crc32c_commit.tar.gz"
	"https://github.com/cisco/libsrtp/archive/$_libsrtp_commit.tar.gz"
	"fix-for-ffmpeg7.patch")
sha256sums=('b6bb446b4f7bff8b47da859cafeab6dcbc4215e606de3afce49129d8314e2970'
            '1808b8d426eb9e76bad35c443f9fc12b7d5543ab57a0e5c6a7be53dba88dcff3'
            '50ac512ad20ebca0be21bcf7c3c6d15aa3fcc27550b09825fab061bffe512bdf'
            'e9ea6288246f3cb21954393a19fda09f4dd252147967a30bb8824c2168620c61'
            '2146a34d3e86baff0820d19faf4da6389bd53b7fc1411ef5a48a7980cda57459')

prepare() {
	mkdir -p libyuv
	_patch_ tg_owt-$_commit
	cd tg_owt-$_commit
	sed -ie 's/include(cmake\/libabsl.cmake)//' CMakeLists.txt
	mv $srcdir/libyuv-$_libyuv_commit/* src/third_party/libyuv/
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

