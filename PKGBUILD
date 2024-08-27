# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=aquamarine
pkgver=0.3.3
pkgrel=1
pkgdesc='A very light linux rendering backend library'
url='https://github.com/hyprwm/aquamarine'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Clause)
depends=(libdrm libinput hyprutils pixman libdisplay-info wayland seatd mesa)
makedepends=(cmake wayland-protocols hwdata hyprwayland-scanner linux-headers)
source=("https://github.com/hyprwm/aquamarine/archive/refs/tags/v$pkgver.tar.gz"
	"0001-cmake-link-libOpenGL-instead-of-legacy-libGL.patch")
sha256sums=('8785d2d0d23ece3dda39c6a51d36b321611578a8339fcfe9f110e17b309d8047'
            '09e2a23bba92dd7bf9e99e08352a7b60084cb437e422cb52d0e2b5ec5edfdd90')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build () {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-$pkgver"/LICENSE
}
