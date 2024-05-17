# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=telegram-desktop
pkgver=5.0.1
pkgrel=1
pkgdesc='Official Telegram Desktop client.'
url='https://desktop.telegram.org/'
arch=(x86_64 aarch64)
license=(GPL3)
depends=(qt6-base qt6-svg qt6-imageformats qt6-wayland openh264 abseil-cpp
	 ffmpeg openssl libopus libvpx glib glibmm libdispatch hunspell
	 kcoreaddons openal-soft rnnoise xxhash zlib-ng boost-libs tl-expected
	 protobuf)
makedepends=(cmake ninja boost libtg_owt gobject-introspection lld)
_apiid=611335
_apihash=d524b414d21f4d37f08684c1df41ac9c
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v$pkgver/tdesktop-$pkgver-full.tar.gz"
	"fix-for-ffmpeg7.patch"
	"use-lld.patch")
sha256sums=('728bf0cf4c795ef3c481c958ab9b2a8e4799679f6ad7e823723b984dd3ce72d8'
            'f49a16359b5094e2ffe73cf193650e032b39f8441fab467d22946e155086f556'
            '19cdd86b87ea3e756ea0f5872f2bad15efb3e458f335bd47a1c33b99017d8426')

prepare() {
	_patch_ tdesktop-$pkgver-full
}

build () {
	cmake -B build tdesktop-$pkgver-full -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr			\
		-DCMAKE_BUILD_TYPE=Release			\
		-DDESKTOP_APP_USE_PACKAGED=ON			\
		-DDESKTOP_APP_DISABLE_X11_INTEGRATION=ON	\
		-DTDESKTOP_API_ID=$_apiid			\
		-DTDESKTOP_API_HASH=$_apihash			\
		-DDESKTOP_APP_DISABLE_JEMALLOC=ON
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR=$pkgdir cmake --install build
}
