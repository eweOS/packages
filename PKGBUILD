# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl2-compat
pkgver=2.32.62
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
source=("https://github.com/libsdl-org/sdl2-compat/releases/download/release-${pkgver}/sdl2-compat-${pkgver}.tar.gz")
sha256sums=('23019a3b0825e2fd3411901df3e1ae24c595cd57e20a345509f77472bd9000e0')

build() {
  # sdl2-compat contains static libraries, thus we should enable
  # -ffat-lto-objects to ensure linking works even without -flto supplied at
  # linktime.
  # Tests are disabled, or X11 libraries are necessary.
  check_option lto y && export CFLAGS="$CFLAGS -ffat-lto-objects"
  cmake -S sdl2-compat-$pkgver \
    -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DSDL2COMPAT_TESTS=OFF \
    -DSDL2COMPAT_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  _install_license_ "sdl2-compat-$pkgver/LICENSE.txt"
}
