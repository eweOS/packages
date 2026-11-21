# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-config
pkgver=2.5.1
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
makedepends=("lxqt-build-tools" "qt6-base-devel")
# no-x11: Downstream, eweOS has no X11 support.
# Remove X11-only cursor settings and monitor backend.
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	no-x11.patch
)
sha256sums=('e46d6ec711a928ba1dc202bc5eac58c025decf84fe85ff01a4b2128e17e88917'
            'e9348fcb86dc2a52c60b0bb357835df0d96071b41c067127d141309518f8bfb5')

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
