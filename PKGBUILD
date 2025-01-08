# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprcursor"
pkgver=0.1.11
pkgrel=2
pkgdesc="The hyprland cursor format, library and utilities"
arch=(any)
url="https://github.com/hyprwm/hyprcursor"
license=('BSD')
depends=('hyprlang' 'libhyprlang.so' 'cairo' 'librsvg' 'libzip' 'tomlplusplus')
provides=("lib$pkgname.so")
makedepends=('git' 'cmake')
_archive="${pkgname}-${pkgver}"
source=(
	"$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Fix-includes.patch"
)
sha256sums=('17e4576b884e6bdb463b445cffff099ad16647b826a87a67b78d38b8cad4c39e'
            '56be1a27d4fe90b5256782fe6410b2ef8e5c31c76499b81505c2535166975637')

prepare() {
	_patch_ "$_archive"
	# clang is not outdated any more
	sed -i 's/Clang/ClangSKIP/' $_archive/CMakeLists.txt
}

build() {
	cd "$_archive"
	cmake \
		--no-warn-unused-cli \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-S . -B ./build
	cmake --build ./build --config Release --target all
}

package() {
	cd "$_archive"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
