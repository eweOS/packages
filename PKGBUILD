# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tl-expected
pkgver=1.2.0
pkgrel=1
pkgdesc='C++11/14/17 std::expected with functional-style extensions.'
url='https://tl.tartanllama.xyz'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(CC0-1.0)
depends=(musl)
makedepends=(cmake samurai)
source=("https://github.com/TartanLlama/expected/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5424f5fc74e79157b9981ba2578a28e0285ac6ec2a8f075e86c41226fe33386')

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
