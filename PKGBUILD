# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-notificationd
pkgver=2.2.0
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
sha512sums=('b6da6bbab563b3cb1a174713b2a8a6c08f719a21b4e1e45796b8c16d8ac7a2fd5cccde64a7a986ed1b3f4b4058b50b3bb57da3bdde3fe8cee7b3d9324a634e2f'
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
