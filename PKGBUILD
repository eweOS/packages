# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=fcitx5-configtool
pkgver=5.1.5
pkgrel=1
pkgdesc='Configuration tool for fcitx5'
url='https://github.com/fcitx/fcitx5-configtool'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(fcitx5 fcitx5-qt qt6-base qt6-svg kwidgetsaddons kitemviews iso-codes)
makedepends=(cmake extra-cmake-modules)
provides=(libFcitx5Migrator.so)
source=("https://github.com/fcitx/fcitx5-configtool/archive/refs/tags/$pkgver.tar.gz"
	"disable-x11.patch")
sha256sums=('26d949116915e870f345171d24a052cda301628e8f6cf4ee62fac2a3baebd101'
            'd4c2450337f86da80d90d0a60c4bf464bbc3a236c1bc57d8141afca6512ef7db')

prepare() {
	_patch_ fcitx5-configtool-$pkgver
}

build () {
	cmake -B build -S fcitx5-configtool-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DENABLE_KCM=OFF			\
		-DENABLE_X11=OFF
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR=$pkgdir cmake --install build
}
