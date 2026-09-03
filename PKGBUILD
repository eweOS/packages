# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=opencc
pkgname=($pkgbase python-$pkgbase)
pkgver=1.4.2
pkgrel=1
pkgdesc='Conversion between Traditional and Simplified Chinese'
url='https://opencc.byvoid.com'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(libmarisa llvm-libs musl)
makedepends=(cmake tclap python-build python-installer python-setuptools rapidjson)
checkdepends=(googletest)
# 0001: From downstream.
source=(
	"https://github.com/BYVoid/OpenCC/archive/refs/tags/ver.$pkgver.tar.gz"
	"0001-reuse-prebuilt-extension.patch"
)
sha256sums=(
	'8e5f5cf7fe195bd9b9be851adc9738c1ef7dc5c24441dd5878a56db4087a9a70'
	'1995c234ba634d81952b22a2e131a9f40fef45c4b4ce7c7c82a34d328714cc3f'
)

prepare() {
	_patch_ OpenCC-ver.$pkgver
}

build () {
	cmake -S OpenCC-ver.$pkgver -B build \
		-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DBUILD_DOCUMENTATION=OFF	\
		-DENABLE_GTEST=ON		\
		-DENABLE_BENCHMARK=OFF		\
		-DENABLE_DARTS=OFF		\
		-DBUILD_PYTHON=ON		\
		-DUSE_SYSTEM_GTEST=ON		\
		-DUSE_SYSTEM_MARISA=ON		\
		-DUSE_SYSTEM_RAPIDJSON=ON	\
		-DUSE_SYSTEM_TCLAP=ON
	cmake --build build

	cd OpenCC-ver.$pkgver
	python -m build -wn
}

check() {
	ctest --test-dir build
}

package_opencc() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ OpenCC-ver.$pkgver/LICENSE
}

package_python-opencc() {
	depends+=(python)

	cd OpenCC-ver.$pkgver
	python -m installer -d "$pkgdir" dist/*.whl
	_install_license_ LICENSE
}
