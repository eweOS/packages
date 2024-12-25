# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=intel-gmmlib
pkgver=22.5.5
pkgrel=1
pkgdesc='Intel Graphics Memory Management Library'
url='https://github.com/intel/gmmlib/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
provides=(libigdgmm.so)
source=("https://github.com/intel/gmmlib/archive/refs/tags/intel-gmmlib-$pkgver.tar.gz")
sha256sums=('08db696071510b7e03aa2d9fb7375c6c35f7c327ecd6747424c664c622bb4377')
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
