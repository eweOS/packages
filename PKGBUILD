# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=telegram-desktop
pkgver=6.6.1
pkgrel=6
pkgdesc='Official Telegram Desktop client'
url='https://desktop.telegram.org/'
arch=(x86_64 aarch64 loongarch64)
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-svg qt6-imageformats qt6-wayland openh264 abseil-cpp
	 ffmpeg openssl libopus libvpx glib glibmm libdispatch hunspell
	 kcoreaddons openal-soft rnnoise xxhash zlib-ng boost-libs tl-expected
	 libavif libheif libjxl protobuf libsrtp libpipewire ada-url)
makedepends=(cmake ninja boost libtg_owt gobject-introspection lld git gperf qt6-base-devel)
_apiid=611335
_apihash=d524b414d21f4d37f08684c1df41ac9c
# Committed on 2026.3.3
_tdlib_commit=af0cb1d30a1e5cb1a10cd83b48998ca9ea9ce249
# 0001: Downstream, LLD has a lower peak memory requirement than Mold.
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v$pkgver/tdesktop-$pkgver-full.tar.gz"
	"git+https://github.com/tdlib/td.git#commit=$_tdlib_commit"
	"0001-use-lld.patch")
sha256sums=('072d3691bea31649971cec96e85f152e0970824e6b81aadc1f7c0c1cb1e7208f'
            'ee382329d09cd93ab43cfbb28b9513def9a1f49474881906d020223d875629c1'
            '19cdd86b87ea3e756ea0f5872f2bad15efb3e458f335bd47a1c33b99017d8426')

prepare() {
	_patch_ "tdesktop-$pkgver-full"
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
