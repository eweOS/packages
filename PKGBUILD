# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=aquamarine
pkgver=0.9.5
pkgrel=2
pkgdesc='A very light linux rendering backend library'
url='https://github.com/hyprwm/aquamarine'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(libdrm libinput hyprutils pixman libdisplay-info wayland seatd mesa)
makedepends=(cmake wayland-protocols hwdata hyprwayland-scanner linux-headers)
provides=(libaquamarine.so)
source=("https://github.com/hyprwm/aquamarine/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('657e4752542872549a556d9facb8a525276b4edd5ca197818835904768aaad40')

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
