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
# 0001: Backport, cabec72deea0 ("CGALConfig.cmake: resolve symlinks before computing CGAL_CONFIG_DIR (fix #8521) (#9390)")
#	Fix failure when looking up for CGAL on /usr-merged system where /lib is
#	a symlink to /usr/lib
source=("https://github.com/CGAL/cgal/releases/download/v$pkgver/CGAL-$pkgver.tar.xz"
	0001-CGALConfig-cmake-resolve-symlinks-before-computing.patch)
sha256sums=('fbc32816745e871a5cbdeb6245317e9dbf10ae1a957b0ab1edb00b4fde00ba8d'
            '4540a84c5cf1b1eae55154c574b857b3d16b42051dd77779902b41a61653d9d3')

prepare() {
	_patch_ "CGAL-$pkgver"
}

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
