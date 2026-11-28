# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=fcitx5-anthy
pkgver=5.1.12
pkgrel=1
pkgdesc='Anthy wrapper for fcitx5.'
url='https://github.com/fcitx/fcitx5-anthy'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(anthy fcitx5)
makedepends=(cmake extra-cmake-modules)
source=("https://github.com/fcitx/fcitx5-anthy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('31a6c5dd7eeae608ec6892bc4aefadbe2f5cf71974486100309e71fd927f0482')

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
