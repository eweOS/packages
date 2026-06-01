# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl3
pkgver=3.4.10
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3)"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://www.libsdl.org"
license=('Zlib')
depends=('mesa')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'meson' 'ninja' 'pipewire'
             'linux-headers' 'libdecor' 'vulkan-headers')
optdepends=(
  'alsa-lib: ALSA audio driver'
  'libpulse: PulseAudio audio driver'
  'pipewire: PipeWire audio driver'
  'vulkan-driver: vulkan renderer'
  'libdecor: Wayland client decorations'
)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz")
sha256sums=('12b34280415ec8418c864408b93d008a20a6530687ee613d60bfbd20411f2785')

build() {
  cmake -S SDL3-${pkgver} -B build -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D SDL_STATIC=OFF \
    -D SDL_RPATH=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 SDL3-${pkgver}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
