# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=intel-media-driver
pkgver=26.3.0
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
source=("https://github.com/intel/media-driver/archive/refs/tags/intel-media-$pkgver.tar.gz"
	"0001-silence-clang-cxx-vla-extension.patch")
sha256sums=('ceeb7a5914953bc03c93daa1251ab41f1e5706bfc272dac3d4d4443a20689002'
            '889a9c9dce82ff752e36dffca5d947e7f5fe1cc7b640d4779a2e2df38842f05b')
_dirname="media-driver-intel-media-$pkgver"

prepare() {
	_patch_ "$_dirname"
}

build() {
	cmake -S "$_dirname" -B build \
		-DBUILD_TYPE=release		\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5

	# NOTE: open a lot of fds during linking, adjust ulimit on demand
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$_dirname"/LICENSE.md
}
