# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-config
pkgver=2.1.0
pkgrel=1
pkgdesc="LXQt system configuration."
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# Upstream licenses are messy and need clarifications... https://github.com/lxqt/lxqt-config/issues/966
license=("LGPL2.1")
depends=("qt6-base" "qt6-svg" "libkscreen"
         "libQt6Xdg.so" "liblxqt" "lxqt-themes" "lxqt-menu-data"
         "libudev" "zlib")
makedepends=("lxqt-build-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	no-x11.patch
)
sha256sums=('fa81bdf793d396da8cc9aed1f61df532606152092ad0d3b52674e06b0121780d'
            '169bfa76c12f4ddbb2f086303eaf52516c892e3801722de9187b68817ba076b7')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DWITH_INPUT=OFF \
		-DWITH_TOUCHPAD=OFF \
		-DWITH_BRIGHTNESS=OFF
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
