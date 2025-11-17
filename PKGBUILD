# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-notificationd
pkgver=2.3.0
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
sha512sums=('bda9f9dbbc5ce13a12d411554fe8f084358d5ae6879949da90c3e5b8029b59af2aefe0adf262c977dcd2dd0e1e2e6862e4754db0f9d301f208b1cc7e49560d98'
            '04123bcfeb9e62e8858c51db6d388206dc4d713883683a46c97f0aedb785c7780763d83e53c0301cf7d75b277496db7c48320e5a017c74d1752294d26da1aa06')

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
