# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl2
pkgver=2.30.4
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://www.libsdl.org"
license=('MIT')
provides=('libsdl2')
depends=('mesa')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'meson' 'ninja' 'pipewire'
	     'linux-headers')
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz")
sha256sums=('59c89d0ed40d4efb23b7318aa29fe7039dbbc098334b14f17f1e7e561da31a26')

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
