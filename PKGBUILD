# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=intel-gmmlib
pkgver=22.7.1
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
sha256sums=('3b84d993950069f0a9b0cc373e2f4b026b194d8fdfb2a8856490d17dadd1b5a5')
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
