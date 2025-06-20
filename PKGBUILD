# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl2-compat
pkgver=2.32.56
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
sha256sums=('27e845b1b7dc0a91a85f1a1f18892ed205adb38caf767741eb258008d8264de0'
            '06ea21937df9dcdc1f6d828061d2e2d35470edfdc2eae63698baba708bde70d1')

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
