# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=aquamarine
pkgver=0.9.4
pkgrel=1
pkgdesc='A very light linux rendering backend library'
url='https://github.com/hyprwm/aquamarine'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(libdrm libinput hyprutils pixman libdisplay-info wayland seatd mesa)
makedepends=(cmake wayland-protocols hwdata hyprwayland-scanner linux-headers)
provides=(libaquamarine.so)
source=("https://github.com/hyprwm/aquamarine/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fccc7c4e9b42b34082690ba672ba54025b781eca46c48ec304b7e5b2ba775893')

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
