# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=telegram-desktop
pkgver=6.0.2
pkgrel=5
pkgdesc='Official Telegram Desktop client'
url='https://desktop.telegram.org/'
arch=(x86_64 aarch64 loongarch64)
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-svg qt6-imageformats qt6-wayland openh264 abseil-cpp
	 ffmpeg openssl libopus libvpx glib glibmm libdispatch hunspell
	 kcoreaddons openal-soft rnnoise xxhash zlib-ng boost-libs tl-expected
	 libavif libheif libjxl protobuf libsrtp libpipewire ada-url)
makedepends=(cmake ninja boost libtg_owt gobject-introspection lld git gperf)
_apiid=611335
_apihash=d524b414d21f4d37f08684c1df41ac9c
# Committed on 2025.05.27
_tdlib_commit=e894536b2f46caad93f997448d2daff9431b19dd
# 0001: Downstream, LLD has a lower peak memory requirement than Mold.
# 0002: Backport, fix missing includes which cause build failures on libc++
#	https://github.com/desktop-app/lib_webview/pull/122
# 0003, 0004: Under review, fix compatibility with GLib 2.86.0, which removes
#	platform-specific types from Gio-2.0 GIR file.
#	https://github.com/desktop-app/lib_base/pull/274
#	https://github.com/desktop-app/cmake_helpers/pull/423
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v$pkgver/tdesktop-$pkgver-full.tar.gz"
	"git+https://github.com/tdlib/td.git#commit=$_tdlib_commit"
	"0001-use-lld.patch"
	"0002-add-missing-includes.patch"
	"0003-Generate-CPP-binding-for-GioUnix-2.0-on-Linux-platfo.patch.cmake_helpers"
	"0004-Fix-missing-Gio-DesktopAppInfo-when-building-against.patch.lib_base")
sha256sums=('81e981079f2a056189783e25aac627b6709dd205b10ee3ef7465cae54245d362'
            'f3d065d8c3c1c99609ab149f73e24255503857fd2964abfdec1bfd4cedc92843'
            '19cdd86b87ea3e756ea0f5872f2bad15efb3e458f335bd47a1c33b99017d8426'
            '55aebfaf5a274d0c3dfb6324fbfdfb5eabcc3de72e290ff8c716fe5e4fcd4053'
            '7730e323161d2263a32047939bd4c93e6f0815ceb7a2f870454855515a4ae30b'
            'a4d7f8b52e5c95f84f82eb68d746686ae569c2f583207c7ca6f7199e6b484c93')

prepare() {
	_patch_ "tdesktop-$pkgver-full"

	patch -p1 -d "tdesktop-$pkgver-full"/cmake/ \
		< 0003-Generate-CPP-binding-for-GioUnix-2.0-on-Linux-platfo.patch.cmake_helpers
	patch -p1 -d "tdesktop-$pkgver-full"/Telegram/lib_base/ \
		< 0004-Fix-missing-Gio-DesktopAppInfo-when-building-against.patch.lib_base
}

build () {
	export MAKEFLAGS="-j$jobs CC=cc CXX=c++"
	export LDFLAGS="$LDFLAGS -Wl,-z,stack-size=$((1024 * 1024))"

	# Telegram requires the TDE2E part of tdlib. As it's not used by any
	# other packages, let's build it in place.
	cmake -B build-tde2e td -G Ninja \
		-DCMAKE_INSTALL_PREFIX="$srcdir/tde2e-install"	\
		-DCMAKE_BUILD_TYPE=Release			\
		-DTD_E2E_ONLY=ON
	cmake --build build-tde2e
	cmake --install build-tde2e

	CMAKE_PREFIX_PATH="$srcdir/tde2e-install" \
	cmake -B build "tdesktop-$pkgver-full" -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr			\
		-DCMAKE_BUILD_TYPE=Release			\
		-DDESKTOP_APP_USE_PACKAGED=ON			\
		-DDESKTOP_APP_DISABLE_X11_INTEGRATION=ON	\
		-DTDESKTOP_API_ID=$_apiid			\
		-DTDESKTOP_API_HASH=$_apihash
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
