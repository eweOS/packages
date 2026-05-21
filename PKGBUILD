# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=intel-gmmlib
pkgver=22.10.0
pkgrel=2
pkgdesc='Intel Graphics Memory Management Library'
url='https://github.com/intel/gmmlib/'
# TODO: make it portable
arch=(x86_64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
provides=(libigdgmm.so)
source=("https://github.com/intel/gmmlib/archive/refs/tags/intel-gmmlib-$pkgver.tar.gz")
sha256sums=('893e3c5a24b408ac312a0318b70f38f427f297646e323f31e79d3a06a92c1543')
_dirname="gmmlib-intel-gmmlib-$pkgver"

build() {
	cmake -S "$_dirname" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$_dirname"/LICENSE.md
}
