# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-notificationd
pkgver=2.1.0
pkgrel=1
pkgdesc="LXQt notification daemon and library."
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/lxqt-notificationd/blob/2.0.1/AUTHORS#L9
license=("LGPL-2.1-or-later")
depends=("qt6-base" "liblxqt" "kwindowsystem" "libQt6Xdg.so" "layer-shell-qt")
makedepends=("cmake" "lxqt-build-tools")
provides=("notification-daemon")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	no-x11.patch
)
sha512sums=('4bb72c8303161c036febfe88ee2a1b32f24f61d2fe17d86d1077045e7784cf31cade0138f526f49c408402f4b81143af0106093569654dd4d579cbb1dd036808'
            '89aadf7567414bcbee4b7a8bbf851ca8c24e16c7f37823ac8c299c1e01a5d5e6760ace985b44b12dd2f545a47794713b0162b27a78ed847913d5b7cd0f69b0d3')

prepare() {
	_patch_ $pkgname-$pkgver
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
