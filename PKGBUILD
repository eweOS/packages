# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=intel-gmmlib
pkgver=22.6.0
pkgrel=1
pkgdesc='Intel Graphics Memory Management Library'
url='https://github.com/intel/gmmlib/'
# TODO: make it portable
arch=(x86_64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
provides=(libigdgmm.so)
source=("https://github.com/intel/gmmlib/archive/refs/tags/intel-gmmlib-$pkgver.tar.gz")
sha256sums=('2be3de25e45ed6b32d6ea173510b9e4ce141c22f9d6ed18dd5b574b33f34748c')
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
