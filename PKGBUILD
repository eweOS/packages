# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=cgal
pkgver=6.2
pkgrel=1
pkgdesc='C++ library for Geometric algorithms'
url='https://www.cgal.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(bash)
makedepends=(cmake)
source=("https://github.com/CGAL/cgal/releases/download/v$pkgver/CGAL-$pkgver.tar.xz")
sha256sums=('fbc32816745e871a5cbdeb6245317e9dbf10ae1a957b0ab1edb00b4fde00ba8d')

build() {
	cmake -S "CGAL-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCGAL_ENABLE_TESTING=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
