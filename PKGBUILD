# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=intel-media-driver
pkgver=26.2.0
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI'
url='https://github.com/intel/media-driver/'
# TODO: make intel-gmmlib portable
arch=(x86_64)
license=(BSD-3-Clause MIT)
depends=(musl libva intel-gmmlib)
makedepends=(cmake linux-headers)
# 0001: Downstream, silent Clang warnings about usage of VLA, which is common
#	in intel-media-driver
# 0002: Under review, fix compatibility with CMake 4.0
source=("https://github.com/intel/media-driver/archive/refs/tags/intel-media-$pkgver.tar.gz"
	"0001-silence-clang-cxx-vla-extension.patch"
        "0002-fix-compatibility-with-cmake-4.0.patch::https://github.com/intel/media-driver/pull/1919.patch")
sha256sums=('32f984333d0804ec8f784f25cf443499ee86074a7da7791483d9a9afbfa97c74'
            '889a9c9dce82ff752e36dffca5d947e7f5fe1cc7b640d4779a2e2df38842f05b'
            '03dfeb072533b20e79bdff83e38f6f729010c771e7896955c83c4dc0e35b8b83')
_dirname="media-driver-intel-media-$pkgver"

prepare() {
	_patch_ "$_dirname"
}

build() {
	cmake -S "$_dirname" -B build \
		-DBUILD_TYPE=release		\
		-DCMAKE_INSTALL_PREFIX=/usr

	# NOTE: open a lot of fds during linking, adjust ulimit on demand
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$_dirname"/LICENSE.md
}
