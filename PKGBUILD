# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libmarisa
pkgver=0.3.0
pkgrel=1
pkgdesc='Matching Algorithm with Recursively Implemented StorAge'
url='https://github.com/s-yata/marisa-trie'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl)
makedepends=(cmake)
provides=(libmarisa.so)
source=("$pkgname-$pkgver.tar.gz::https://github.com/s-yata/marisa-trie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3057d0c2da0a9a57f43eb8e07b73715bc5ff053467ee8349844d01da91b5efb')

build () {
	cmake -S "marisa-trie-$pkgver" -B build 	\
		-DCMAKE_BUILD_TYPE=Release		\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DBUILD_TESTING=ON			\
		-DENABLE_TOOLS=ON
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	cd "marisa-trie-$pkgver"
	_install_license_ COPYING.md
}

