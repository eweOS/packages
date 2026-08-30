# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libtg_owt
_commit=19d51d3c19632a63fdbe17c62f10332d978cb940
_libyuv_commit=ec6f15079ff373b7651698a68bba7244b3556981
_crc32c_commit=2bbb3be42e20a0e6c0f7b39dc07dc863d9ffbc07
pkgver=r20260803.${_commit:0:7}
pkgrel=1
pkgdesc="Telegram's fork of WebRTC"
url='https://github.com/desktop-app/tg_owt'
arch=(x86_64 aarch64 loongarch64)
license=(BSD-3-Clause)
depends=(abseil-cpp ffmpeg libjpeg openssl openh264 libopus libpipewire libvpx
	 libsrtp)
makedepends=(cmake git linux-headers python)
source=("$url/archive/$_commit.tar.gz"
	"git+https://gitlab.com/chromiumsrc/libyuv.git#commit=$_libyuv_commit"
	"https://github.com/google/crc32c/archive/$_crc32c_commit.tar.gz")
sha256sums=('eee57f5f544dd8c0e29719a0c3ec56c221ade343036caf080e260d6c695167df'
            '8e42db1f3e308c3baefc7c2c1368f29af12650f75305b4a2e2c0ea6fa00d21bc'
            '56be8308f23626f82075a035daabd473c8e2b86344768c46182afe86edebf49d')

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

