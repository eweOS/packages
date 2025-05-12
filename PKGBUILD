# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=telegram-desktop
pkgver=5.14.2
pkgrel=1
pkgdesc='Official Telegram Desktop client'
url='https://desktop.telegram.org/'
arch=(x86_64 aarch64 loongarch64)
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-svg qt6-imageformats qt6-wayland openh264 abseil-cpp
	 ffmpeg openssl libopus libvpx glib glibmm libdispatch hunspell
	 kcoreaddons openal-soft rnnoise xxhash zlib-ng boost-libs tl-expected
	 protobuf libsrtp libpipewire ada-url)
makedepends=(cmake ninja boost libtg_owt gobject-introspection lld)
_apiid=611335
_apihash=d524b414d21f4d37f08684c1df41ac9c
# 0001: downstream, LLD has a lower peak memory requirement than Mold.
# 0002: upstream, https://github.com/desktop-app/lib_webview/pull/122
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v$pkgver/tdesktop-$pkgver-full.tar.gz"
	"0001-use-lld.patch"
	"0002-add-missing-includes.patch")
sha256sums=('8a3b2570475584317651c76407176ad884f073b1eacaf07333c9037806279f02'
            '19cdd86b87ea3e756ea0f5872f2bad15efb3e458f335bd47a1c33b99017d8426'
            '55aebfaf5a274d0c3dfb6324fbfdfb5eabcc3de72e290ff8c716fe5e4fcd4053')

prepare() {
	_patch_ "tdesktop-$pkgver-full"
}

build () {
	export MAKEFLAGS="-j$jobs CC=cc CXX=c++"
	export LDFLAGS="$LDFLAGS -Wl,-z,stack-size=$((1024 * 1024))"
	cmake -B build "tdesktop-$pkgver-full" -G Ninja \
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
	DESTDIR="$pkgdir" cmake --install build
}
