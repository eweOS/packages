# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rapidcheck
_commit=ff6af6fc683159deb51c543b065eba14dfcf329b
pkgver=20231214."${_commit:0:7}"
pkgrel=1
pkgdesc='A C++ framework for property based testing inspired by QuickCheck'
url='https://github.com/emil-e/rapidcheck'
arch=(x86_64 aarch64 riscv64)
license=(BSD-2-Clause)
depends=(musl)
makedepends=(cmake)
provides=(librapidcheck.so)
source=("git+https://github.com/emil-e/rapidcheck.git#commit=$_commit")
sha256sums=('f12e4e1d2b57b290780dbb9f05c75d3e42b9a71ee27b0eb55e71a7bdfd0b5f1e')

build () {
	cmake -S "$pkgname" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DRC_ENABLE_RTTI=ON			\
		-DRC_ENABLE_TESTS=OFF

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname"/LICENSE.md
}
