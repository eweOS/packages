# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl2-compat
pkgver=2.32.50
pkgrel=1
pkgdesc="An SDL2 compatibility layer that uses SDL3 behind the scenes"
url="https://github.com/libsdl-org/sdl2-compat"
depends=('musl' 'sdl3')
makedepends=('cmake' 'ninja')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
conflicts=('sdl2')
provides=("sdl2=${pkgver}")
replaces=('sdl2')
license=('Zlib')
source=(
  "https://github.com/libsdl-org/sdl2-compat/releases/download/release-${pkgver}/sdl2-compat-${pkgver}.tar.gz"
  no-x11.patch
)
sha256sums=('b559c734f2cdc4ea34266a1ef7724cbf3a729deaab23a774aa60a980368f5a88'
            '3e94bdce926ac47c2a7d607c394a9cecfb10474c73df1371a83c22a586ed127c')

prepare() {
  _patch_ sdl2-compat-$pkgver
}

build() {
  cmake -S sdl2-compat-$pkgver \
    -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  _install_license_ "sdl2-compat-$pkgver/LICENSE.txt"
}
