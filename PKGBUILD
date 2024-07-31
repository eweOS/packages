# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=opencc
pkgver=1.1.8
pkgrel=1
pkgdesc='Conversion between Traditional and Simplified Chinese'
url='https://github.com/BYVoid/OpenCC'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(libmarisa)
makedepends=(cmake tclap python rapidjson)
checkdepends=(googletest)
source=("https://github.com/BYVoid/OpenCC/archive/refs/tags/ver.$pkgver.tar.gz")
sha256sums=('51693032e702ccc60765b735327d3596df731bf6f426b8ab3580c677905ad7ea')

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
