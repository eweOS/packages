# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=telegram-desktop
pkgver=5.7.2
pkgrel=3
pkgdesc='Official Telegram Desktop client'
url='https://desktop.telegram.org/'
arch=(x86_64 aarch64)
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-svg qt6-imageformats qt6-wayland openh264 abseil-cpp
	 ffmpeg openssl libopus libvpx glib glibmm libdispatch hunspell
	 kcoreaddons openal-soft rnnoise xxhash zlib-ng boost-libs tl-expected
	 protobuf libsrtp libpipewire ada-url)
makedepends=(cmake ninja boost libtg_owt gobject-introspection lld)
_apiid=611335
_apihash=d524b414d21f4d37f08684c1df41ac9c
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v$pkgver/tdesktop-$pkgver-full.tar.gz"
	"use-lld.patch"
	"ffmpeg-7.patch::https://github.com/telegramdesktop/tdesktop/pull/28611.patch")
sha256sums=('3442e28e01d937376e687615e3ee13fb580788c4deb7561b410522ce3452fdef'
            '19cdd86b87ea3e756ea0f5872f2bad15efb3e458f335bd47a1c33b99017d8426'
            'dca13fbfcd01f0f42674d1a27d0e4c0388b330c0a6c226b0418624d0695c5a87')

prepare() {
	_patch_ "tdesktop-$pkgver-full"
}

build () {
	export MAKEFLAGS="-j$jobs CC=cc CXX=c++"
	export LDFLAGS="$LDFLAGS -Wl,-z,stack-size=$((1024 * 1024))"
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
