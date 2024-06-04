# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glu
pkgver=9.0.3
pkgrel=1
pkgdesc="Mesa OpenGL utility library"
arch=(x86_64 aarch64 riscv64)
url="https://gitlab.freedesktop.org/mesa/glu"
license=('LGPL')
depends=('libglvnd')
makedepends=('meson')
source=(https://mesa.freedesktop.org/archive/glu/glu-$pkgver.tar.xz)
sha256sums=('bd43fe12f374b1192eb15fe20e45ff456b9bc26ab57f0eee919f96ca0f8a330f')

build() {
  ewe-meson glu-$pkgver build \
    -D default_library=shared

  # Print config
  meson configure build

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
