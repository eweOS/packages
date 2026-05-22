# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=python-pivy
pkgver=0.6.11
pkgrel=1
pkgdesc='Python bindings to Coin 3D'
url='https://github.com/coin3d/pivy/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(ISC)
depends=(python coin musl llvm-libs python-numpy pyside6 qt6-base)
makedepends=(python cmake swig)
source=("https://github.com/coin3d/pivy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('78f79bd7d1ce7e8140ceba4b1220136ea1f14b4403b1e463c59fa892feed961e')

build() {
	# Some wrapper returns NULL from int-typed functions. Musl defines NULL
	# as nullptr when the C++ standard version is newer than C++ 11,
	# breaking Clang builds since Clang 20 defaults to C++ 17. Override
	# the language version as a simple fix.
	CXXFLAGS=" -std=gnu++98" \
	cmake -S pivy-"$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ pivy-"$pkgver"/LICENSE
}
