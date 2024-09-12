# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=qt6-imageformats
_qtver=6.7.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework'
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
depends=(qt6-base libtiff libwebp zlib-ng)
makedepends=(cmake samurai)
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('e1a1d8785fae67d16ad0a443b01d5f32663a6b68d275f1806ebab257485ce5d6')

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
