# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ada-url
pkgver=3.4.4
pkgrel=2
pkgdesc='WHATWG-compliant and fast URL parser written in modern C++'
url='https://ada-url.com'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0 MIT)
depends=(musl)
makedepends=(cmake python)
provides=(libada.so)
source=("https://github.com/ada-url/ada/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77bc5bbc383ed098cc60266ad6ee912de2431bb62d89248c0e17c4e712dcdaf9')

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
