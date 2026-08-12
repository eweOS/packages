# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=kicad-library
pkgver=10.0.5
pkgrel=1
pkgdesc='Symbol, footprint and template library for KiCAD'
url='https://gitlab.com/kicad/libraries'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("CC-BY-SA-4.0 WITH KiCAD-libraries-exception")
makedepends=(cmake)
source=("https://gitlab.com/kicad/libraries/kicad-symbols/-/archive/$pkgver/kicad-symbols-$pkgver.tar.gz"
	"https://gitlab.com/kicad/libraries/kicad-footprints/-/archive/$pkgver/kicad-footprints-$pkgver.tar.gz"
	"https://gitlab.com/kicad/libraries/kicad-templates/-/archive/$pkgver/kicad-templates-$pkgver.tar.gz")
options=(!strip) # This contains data only.
sha256sums=('8d3b17c9f1d9266d546eb22552d29a427f02d9956b88858f6a0ca2bb197c9cf4'
            'f6305041ea72ab9c55461873dfd67359d28fa9639e7a11952b81d468b2155a8d'
            'bb42390db45f8a6b1539c6f83850ad2091506b6a63598049b4bc805900491145')

build() {
	for d in symbols footprints templates; do
		cmake -S "kicad-$d-$pkgver" -B "$d-build"	\
			-DCMAKE_INSTALL_PREFIX=/usr
	done
}

package() {
	for d in symbols footprints templates; do
		DESTDIR="$pkgdir" cmake --install "$d-build"
		_install_license_ "kicad-$d-$pkgver/LICENSE.md" "$d"
	done
}
