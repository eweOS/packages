# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=opencc
pkgver=1.2.0
pkgrel=2
pkgdesc='Conversion between Traditional and Simplified Chinese'
url='https://opencc.byvoid.com'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(libmarisa)
makedepends=(cmake tclap python rapidjson)
checkdepends=(googletest)
source=("https://github.com/BYVoid/OpenCC/archive/refs/tags/ver.$pkgver.tar.gz")
sha256sums=('f4f86eb25e239450d075081e08594801aa063c298d21d9f6c6aa85cd55241962')

build () {
	cmake -S OpenCC-ver.$pkgver -B build \
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
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ OpenCC-ver.$pkgver/LICENSE
}
