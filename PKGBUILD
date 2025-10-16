# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=intel-gmmlib
pkgver=22.8.2
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
sha256sums=('2e43e538a002574f45d480a24e02297c960963dc7914b7328791d9836832ff43')
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
