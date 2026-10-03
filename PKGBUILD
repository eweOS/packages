# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=kicad-library
pkgver=10.0.6
pkgrel=1
pkgdesc='Symbol, footprint and template library for KiCAD'
url='https://gitlab.com/kicad/libraries'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("CC-BY-SA-4.0 WITH KiCAD-libraries-exception")
makedepends=(cmake python)
source=("https://gitlab.com/kicad/libraries/kicad-symbols/-/archive/$pkgver/kicad-symbols-$pkgver.tar.gz"
	"https://gitlab.com/kicad/libraries/kicad-footprints/-/archive/$pkgver/kicad-footprints-$pkgver.tar.gz"
	"https://gitlab.com/kicad/libraries/kicad-templates/-/archive/$pkgver/kicad-templates-$pkgver.tar.gz")
options=(!strip) # This contains data only.
sha256sums=('5587f5cb4a779d287e49c4ba069a6b42c27b55cbe4c5b6241e39d91878abe571'
            '17827af73192ae17b479d4c502b6f569d03ed855b9d3c0b9b133b8cf1b8d3e22'
            '18b4e3f2ed781383179c1b15a82c94e5176dc825e1c646f84e89ed50e835063b')

build() {
	for d in symbols footprints templates; do
		cmake -S "kicad-$d-$pkgver" -B "$d-build"	\
			-DCMAKE_INSTALL_PREFIX=/usr
		cmake --build "$d-build"
	done
}

package() {
	for d in symbols footprints templates; do
		DESTDIR="$pkgdir" cmake --install "$d-build"
		_install_license_ "kicad-$d-$pkgver/LICENSE.md" "$d"
	done
}
