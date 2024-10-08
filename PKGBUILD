# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprcursor"
pkgver=0.1.10
pkgrel=1
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
)
sha256sums=('67e845404164fee4c5694209b3d5f93a31b6963dbb0bfd6ed2cd96c99b316a08')

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
