# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=qt6-imageformats
_qtver=6.12.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
groups=(qt6)
pkgdesc='A cross-platform application and UI framework'
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
depends=(qt6-base libtiff libwebp zlib-ng)
makedepends=(cmake samurai)
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('0943132b5db8de6b6a7f1d162682173e8763c7ed94e80fd39113292845f67762')

build() {
	cmake -B build $_pkgfn -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DQT_FEATURE_system_zlib=ON		\
		-DQT_FEATURE_system_tiff=ON
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
}
