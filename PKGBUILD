# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=kicad-library-3d
pkgver=9.0.4
pkgrel=1
pkgdesc='3D model library for KiCAD'
url='https://gitlab.com/kicad/libraries/kicad-packages3D'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("CC-BY-SA-4.0 WITH KiCAD-libraries-exception")
makedepends=(cmake)
options=(!strip) # This is a data package.
source=("https://gitlab.com/kicad/libraries/kicad-packages3D/-/archive/$pkgver/kicad-packages3D-$pkgver.tar.gz")
sha256sums=('4deb45a3442233413e03f93a2bb33780a8a990b6d89de6bbd09e4dd3c8a882e5')

build() {
	cmake -S "kicad-packages3D-$pkgver" -B build \
		-DCMAKE_INSTALL_PREFIX=/usr
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "kicad-packages3D-$pkgver"/LICENSE.md
}
