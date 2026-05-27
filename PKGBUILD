# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=md4c
pkgver=0.5.3
pkgrel=1
pkgdesc='C Markdown parser'
url='https://github.com/mity/md4c'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
provides=(libmd4c.so libmd4c-html.so)
source=("https://github.com/mity/md4c/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('353c346f376b87c954a13f3415ede2d51264cc61dc5abcd38ff1d2aa0d059b9e')

build () {
	cmake -S "$pkgname-release-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DBUILD_MD2HTML_EXECUTABLE=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-release-$pkgver"/LICENSE.md
}
