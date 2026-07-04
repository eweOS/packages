# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libtg_owt
_commit=d888bc3f79b4aa80333d8903410fa439db5f6696
_libyuv_commit=ec6f15079ff373b7651698a68bba7244b3556981
_crc32c_commit=2bbb3be42e20a0e6c0f7b39dc07dc863d9ffbc07
pkgver=r20251212.${_commit:0:7}
pkgrel=5
pkgdesc="Telegram's fork of WebRTC"
url='https://github.com/desktop-app/tg_owt'
arch=(x86_64 aarch64 loongarch64)
license=(BSD-3-Clause)
depends=(abseil-cpp ffmpeg libjpeg openssl openh264 libopus libpipewire libvpx
	 libsrtp)
makedepends=(cmake git linux-headers python)
# use-libopengl.patch: Should be upstreamed, search for libOpenGL instead of
#		       libGL to build without GLX.
# 0001: Should be upstreamed, looking for libOpenGL instead of libGL to build
#	without GLX
# 0002: Under review, fix LLVM 20 build where Clang starts to complain about
#	[[lifetimebound]] applied to arguments of void functions.
#	https://github.com/desktop-app/tg_owt/pull/162
source=("$url/archive/$_commit.tar.gz"
	"git+https://gitlab.com/chromiumsrc/libyuv.git#commit=$_libyuv_commit"
	"https://github.com/google/crc32c/archive/$_crc32c_commit.tar.gz"
	"0001-use-libopengl.patch"
	"0002-Remove-ABSL_ATTRIBUTE_LIFETIME_BOUND-from-void-funct.patch")
sha256sums=('4ae4738b85c35bb3a4fbb0f63bc1020c57847d94d91bd226a06a738bdbc3e12f'
            '8e42db1f3e308c3baefc7c2c1368f29af12650f75305b4a2e2c0ea6fa00d21bc'
            '56be8308f23626f82075a035daabd473c8e2b86344768c46182afe86edebf49d'
            'f49cfdb50f5ca0cd7692a43287fd8396e59eeb438a509cce8afd3438736d136b'
            'e55689c8225319bf66dd630f005544e982351b08877a5bff150c9b646dc995af')

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

