# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprcursor"
pkgver=0.1.7
pkgrel=1
pkgdesc="The hyprland cursor format, library and utilities"
arch=(any)
url="https://github.com/hyprwm/hyprcursor"
license=('BSD')
depends=('hyprlang>=0.4.2' 'cairo' 'librsvg' 'libzip' 'tomlplusplus')
makedepends=('git' 'cmake')
_archive="${pkgname}-${pkgver}"
source=(
	"$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('c830733c3e5243e0c5f06b8d137828a45083cc7483e7e874c4bd42e38a82ed9d')

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
