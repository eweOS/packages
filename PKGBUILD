# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-qtplugin
pkgver=2.2.0
pkgrel=2
pkgdesc="LXQt platform integration for Qt"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/lxqt-qtplugin/blob/1.4.1/AUTHORS#L8
license=("LGPL-2.1-or-later")
depends=("libdbusmenu-lxqt" "libqtxdg" "libfm-qt" "libQt6XdgIconLoader.so")
makedepends=("git" "lxqt-build-tools")
source=(
	"git+https://github.com/lxqt/$pkgname#tag=$pkgver"
)
sha256sums=('36ec3bf3b4f7ba8acafb433760b3164bbdd5a976d4158e3513f079ed27752088')

build() {
	cmake -B build -S "$srcdir/$pkgname" \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
