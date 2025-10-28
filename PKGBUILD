# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=fcitx5-configtool
pkgver=5.1.11
pkgrel=1
pkgdesc='Configuration tool for fcitx5'
url='https://github.com/fcitx/fcitx5-configtool'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(fcitx5 fcitx5-qt qt6-base qt6-svg kwidgetsaddons kitemviews iso-codes)
makedepends=(cmake extra-cmake-modules linux-headers)
provides=(libFcitx5Migrator.so)
# 0001: Downstream, Disable X11-related code, mostly related to
#	KeyboardLayoutWidget for displaying keyboard layout, to build on eweOS.
#	Ideally we should re-write this part of code with libxkbcommon.
# 0002: Under reivew, don't link to the unnecessary dependency,
#	PkgConfig::XkbFile, for configlib. This also helps building without X11.
#	https://github.com/fcitx/fcitx5-configtool/pull/96
source=("https://github.com/fcitx/fcitx5-configtool/archive/refs/tags/$pkgver.tar.gz"
	"0001-disable-x11.patch"
	"0002-configlib-Do-not-link-to-unused-PkgConfig-XkbFile.patch")
sha256sums=('e4d84224b38df2a227225f5a3fb4667632925de65a647a0474ecc3d195e6ea86'
            'b98934bd3e21c066bcf0c641a816ef03f64ea85c243960ca40575b01d28b8d7a'
            '5a733762f103038649320c55418d5626a059144bfa7e81b8ea05977f05478ef3')

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
