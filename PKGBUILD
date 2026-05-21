# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=verdict
pkgver=1.4.4
pkgrel=2
pkgdesc='Compute quality functions of 2 and 3-dimensional regions'
url='https://github.com/sandialabs/verdict'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl llvm-libs)
makedepends=(cmake doxygen googletest)
provides=(libverdict.so)
source=("https://github.com/sandialabs/verdict/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d12d1cd41c6568997df348a72cc2973a662fae1b3634a068ea2201b5f7383186')

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-$pkgver"/LICENSE
}
