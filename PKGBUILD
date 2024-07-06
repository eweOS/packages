# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=fcitx5-anthy
pkgver=5.1.4
pkgrel=1
pkgdesc='Anthy wrapper for fcitx5.'
url='https://github.com/fcitx/fcitx5-anthy'
arch=(x86_64 aarch64 riscv6e4)
license=(GPL-2.0-or-later)
depends=(anthy fcitx5)
makedepends=(cmake extra-cmake-modules)
source=("https://github.com/fcitx/fcitx5-anthy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c7c3c5d3f40f8dd7ee8433d0c37f7f450e19e008e56caf73e30f1531ca7ab4ae')

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
