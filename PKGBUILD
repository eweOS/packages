# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-qtplugin
pkgver=2.4.0
pkgrel=2
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
sha256sums=('006e886bdcf84d4b4afe6d2e89291c56eeb5adee494e32f12035b0691ac861df')

build() {
	cmake -B build -S "$srcdir/$pkgname" \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
