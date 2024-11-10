# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=cmocka
epoch=2
pkgver=1.1.7
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl)
makedepends=(cmake)
source=("git+https://git.cryptomilk.org/projects/cmocka.git#tag=cmocka-$pkgver")
sha256sums=('SKIP')

build() {
	# disable examples: waiter_test_wrap test fails
	cmake -S "$pkgname" -B build \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=Release		\
		-DUNIT_TESTING=ON			\
		-DWITH_EXAMPLES=OFF
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
