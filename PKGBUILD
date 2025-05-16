# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ada-url
pkgver=3.2.4
pkgrel=1
pkgdesc='WHATWG-compliant and fast URL parser written in modern C++'
url='https://ada-url.com'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0 MIT)
depends=(musl)
makedepends=(cmake python)
provides=(libada.so)
source=("https://github.com/ada-url/ada/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce79b8fb0f6be6af3762a16c5488cbcd38c31d0655313a7030972a7eb2bda9e5')

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
