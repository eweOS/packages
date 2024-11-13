# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=aquamarine
pkgver=0.4.4
pkgrel=2
pkgdesc='A very light linux rendering backend library'
url='https://github.com/hyprwm/aquamarine'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(libdrm libinput hyprutils pixman libdisplay-info wayland seatd mesa)
makedepends=(cmake wayland-protocols hwdata hyprwayland-scanner linux-headers)
provides=(libaquamarine.so)
source=("https://github.com/hyprwm/aquamarine/archive/refs/tags/v$pkgver.tar.gz"
	"0001-workaround-sigsegv.patch")
sha256sums=('2ac672bce27ac8a2f2d236582d49a2b6bbe243e9a7a5d06881e636607e897110'
            '3b0283d5a3d3c57d76b1d1dd9ecb7a2991fbcf39a754e962beed991e745f85ea')

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
