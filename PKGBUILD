# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=telegram-desktop
pkgver=5.1.8
pkgrel=2
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
	"use-lld.patch")
sha256sums=('a12ea1894b661c683e9073b401f28b1ad041129a36adc3a262644aad8d1131eb'
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
