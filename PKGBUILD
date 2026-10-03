# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=kicad-library-3d
pkgver=10.0.6
pkgrel=1
pkgdesc='3D model library for KiCAD'
url='https://gitlab.com/kicad/libraries/kicad-packages3D'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("CC-BY-SA-4.0 WITH KiCAD-libraries-exception")
makedepends=(cmake)
options=(!strip) # This is a data package.
source=("https://gitlab.com/kicad/libraries/kicad-packages3D/-/archive/$pkgver/kicad-packages3D-$pkgver.tar.gz")
sha256sums=('def2208ec7e4693642c172d525652d95d7b706f3631930b7c754c559c0ad190a')

build() {
	cmake -S "kicad-packages3D-$pkgver" -B build \
		-DCMAKE_INSTALL_PREFIX=/usr
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "kicad-packages3D-$pkgver"/LICENSE.md
}
