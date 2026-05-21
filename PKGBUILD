# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=fcitx5-anthy
pkgver=5.1.10
pkgrel=2
pkgdesc='Anthy wrapper for fcitx5.'
url='https://github.com/fcitx/fcitx5-anthy'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(anthy fcitx5)
makedepends=(cmake extra-cmake-modules)
source=("https://github.com/fcitx/fcitx5-anthy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('91f305c71e8034b0b37d65c21e28224733c004b2bbc0a6880fc7a0f2de287ef2')

build () {
	cmake -S fcitx5-anthy-$pkgver -B build	\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DENABLE_TEST=ON
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR=$pkgdir cmake --install build
}
