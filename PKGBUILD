# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=toml11
pkgver=4.3.0
pkgrel=1
pkgdesc='TOML for Modern C++'
url='https://toruniina.github.io/toml11/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
source=("https://github.com/ToruNiina/toml11/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af95dab1bbb9b05a597e73d529a7269e13f1869e9ca9bd4779906c5cd96e282b')

build () {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}


package() {
	DESTDIR="$pkgdir" cmake --install build
}
