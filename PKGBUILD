# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=opencc
pkgver=1.1.9
pkgrel=1
pkgdesc='Conversion between Traditional and Simplified Chinese'
url='https://github.com/BYVoid/OpenCC'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(libmarisa)
makedepends=(cmake tclap python rapidjson)
checkdepends=(googletest)
source=("https://github.com/BYVoid/OpenCC/archive/refs/tags/ver.$pkgver.tar.gz")
sha256sums=('ad4bcd8d87219a240a236d4a55c9decd2132a9436697d2882ead85c8939b0a99')

build () {
	cd OpenCC-ver.$pkgver
	cmake . -B build \
		-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DBUILD_DOCUMENTATION=OFF	\
		-DENABLE_GTEST=ON		\
		-DENABLE_BENCHMARK=OFF		\
		-DENABLE_DARTS=OFF		\
		-DBUILD_PYTHON=OFF		\
		-DUSE_SYSTEM_GTEST=ON		\
		-DUSE_SYSTEM_MARISA=ON		\
		-DUSE_SYSTEM_RAPIDJSON=ON	\
		-DUSE_SYSTEM_TCLAP=ON
	cmake --build build
}

check() {
	ctest --test-dir OpenCC-ver.$pkgver/build
}

package() {
	DESTDIR=$pkgdir cmake --install OpenCC-ver.$pkgver/build
	_install_license_ OpenCC-ver.$pkgver/LICENSE
}
