# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=intel-media-driver
pkgver=25.1.2
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI'
url='https://github.com/intel/media-driver/'
# TODO: make intel-gmmlib portable
arch=(x86_64)
license=(BSD-3-Clause MIT)
depends=(musl libva intel-gmmlib)
makedepends=(cmake linux-headers)
source=("https://github.com/intel/media-driver/archive/refs/tags/intel-media-$pkgver.tar.gz"
	"0001-silence-clang-cxx-vla-extension.patch")
sha256sums=('6c11cfe1b9012011d0354b010d191a527fa3a4086152726ba642ca51808029bb'
            '5daa5c7716935c7133e2e9beffff7d635571fa1efbca5b888b8c01f9bff3ddba')
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
