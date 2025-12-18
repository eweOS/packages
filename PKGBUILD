# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tl-expected
pkgver=1.3.1
pkgrel=1
pkgdesc='C++11/14/17 std::expected with functional-style extensions.'
url='https://tl.tartanllama.xyz'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(CC0-1.0)
depends=(musl)
makedepends=(cmake samurai)
source=("https://github.com/TartanLlama/expected/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a04f4f472fbb5c30bf60402f1ca626c4a76987f867978d0b8a35d7ab3fb8fe7')

build () {
	# No tests, need network
	cmake expected-$pkgver -B build	-G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=Release		\
		-DEXPECTED_BUILD_TESTS=OFF		\
		-DEXPECTED_BUILD_PACKAGE=OFF		\
		-DEXPECTED_BUILD_PACKAGE_DEB=OFF
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ expected-$pkgver/COPYING
}
