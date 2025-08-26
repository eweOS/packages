# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=kicad-library
pkgver=9.0.4
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
sha256sums=('57eb10399c906df631e0e046d2e67b0559f931149faba940ccfbacc461f06cbd'
            '9cb0241a309827a303ee5c0a31a06e36b877f2a33508587fba5b841a927ed907'
            '5a32a4d36f6eec2ff8577f978494eadfc8dbedd98c17ce542deaaa7c254ecea8')

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
