# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=md4c
pkgver=0.5.2
pkgrel=1
pkgdesc='C Markdown parser'
url='https://github.com/mity/md4c'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
provides=(libmd4c.so libmd4c-html.so)
source=("https://github.com/mity/md4c/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21')

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
