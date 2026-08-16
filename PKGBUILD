# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ada-url
pkgver=4.0.0
pkgrel=1
pkgdesc='WHATWG-compliant and fast URL parser written in modern C++'
url='https://ada-url.com'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0 MIT)
depends=(musl)
makedepends=(cmake python)
provides=(libada.so)
source=("https://github.com/ada-url/ada/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d6c7ef7dd2e329320d34eb2ab29ccdc879ee3935af9dfb894a6640e58dc381d')

build () {
	cmake -S "ada-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DADA_TESTING=OFF			\
		-DADA_BENCHMARKS=OFF			\
		-DADA_TOOLS=OFF

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
