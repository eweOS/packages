# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl2
pkgver=2.30.11
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.libsdl.org"
license=('MIT')
provides=('libsdl2')
depends=('mesa')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'meson' 'ninja' 'pipewire'
	     'linux-headers')
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz")
sha256sums=('8b8d4aef2038533da814965220f88f77d60dfa0f32685f80ead65e501337da7f')

build() {
  cmake -S SDL2-${pkgver} -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D SDL_STATIC=OFF \
    -D SDL_RPATH=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 SDL2-${pkgver}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
