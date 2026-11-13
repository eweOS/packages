# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-qtplugin
pkgver=2.5.0
pkgrel=1
pkgdesc="LXQt platform integration for Qt"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/lxqt-qtplugin/blob/1.4.1/AUTHORS#L8
license=("LGPL-2.1-or-later")
depends=("libdbusmenu-lxqt" "libqtxdg" "libfm-qt" "libQt6XdgIconLoader.so")
makedepends=("git" "lxqt-build-tools" "qt6-base-devel")
source=(
	"git+https://github.com/lxqt/$pkgname#tag=$pkgver"
)
sha256sums=('814be52105fae967a8f58d6ae434ed30ad73b473669bea63209e7d64fbae9386')

build() {
	cmake -B build -S "$srcdir/$pkgname" \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
