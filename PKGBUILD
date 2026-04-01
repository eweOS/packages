# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=cgal
pkgver=6.1.1
pkgrel=1
pkgdesc='C++ library for Geometric algorithms'
url='https://www.cgal.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(bash)
makedepends=(cmake)
source=("https://github.com/CGAL/cgal/releases/download/v$pkgver/CGAL-$pkgver.tar.xz")
sha256sums=('52506935f70e247ed2777e3c65f20e86f79208c2a2d0e180ae7475daf11c96ef')

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
