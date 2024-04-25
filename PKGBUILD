# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=opencc
pkgver=1.1.7
pkgrel=1
pkgdesc='Conversion between Traditional and Simplified Chinese'
url='https://github.com/BYVoid/OpenCC'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(libmarisa)
makedepends=(cmake tclap python rapidjson)
checkdepends=(googletest)
source=("https://github.com/BYVoid/OpenCC/archive/refs/tags/ver.$pkgver.tar.gz")
sha256sums=('80a12675094a0cac90e70ee530e936dc76ca0953cb0443f7283c2b558635e4fe')

build () {
	cd OpenCC-ver.$pkgver
	cmake . -B build \
		-DCMAKE_BUILD_TYPE=Release	\
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
