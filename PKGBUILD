# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=toml11
pkgver=4.4.0
pkgrel=1
pkgdesc='TOML for Modern C++'
url='https://toruniina.github.io/toml11/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
source=("https://github.com/ToruNiina/toml11/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('815bfe6792aa11a13a133b86e7f0f45edc5d71eb78f5fb6686c49c7f792b9049')

build () {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}


package() {
	DESTDIR="$pkgdir" cmake --install build
}
