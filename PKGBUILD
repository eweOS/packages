# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sdl2-ttf
pkgver=2.24.0
pkgrel=1
pkgdesc='Support for TrueType (.ttf) font files with Simple Directmedia Layer'
url='https://github.com/libsdl-org/SDL_ttf'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Zlib)
depends=(musl sdl2 freetype2 harfbuzz)
makedepends=(cmake)
provides=(libSDL2_ttf-2.0.so)
source=("https://github.com/libsdl-org/SDL_ttf/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('2c45241a56203a59d66ec6b4eae9457e5675fc609376566a257391fd29d341a2')

build() {
	cmake -S "SDL_ttf-release-$pkgver" -B build	\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DSDL2TTF_SAMPLES=OFF			\
		-DSDL2TTF_INSTALL=ON			\
		-DSDL2TTF_VENDORED=OFF			\
		-DSDL2TTF_HARFBUZZ=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
