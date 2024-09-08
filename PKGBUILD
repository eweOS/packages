# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=toml11
pkgver=4.2.0
pkgrel=1
pkgdesc='TOML for Modern C++'
url='https://toruniina.github.io/toml11/'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
source=("https://github.com/ToruNiina/toml11/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9287971cd4a1a3992ef37e7b95a3972d1ae56410e7f8e3f300727ab1d6c79c2c')

build () {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}


package() {
	DESTDIR="$pkgdir" cmake --install build
}
