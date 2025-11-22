# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl12-compat
pkgver=1.2.70
pkgrel=1
pkgdesc="SDL 1.2 runtime compatibility library using SDL 2.0"
url="https://github.com/libsdl-org/sdl12-compat"
depends=('sdl2' 'glu')
makedepends=('cmake')
arch=(x86_64 aarch64 riscv64 loongarch64)
provides=('sdl1')
license=('MIT')
source=("https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=('b8350cc400b9605dd5e319f451f09d5d6e70bb1dfc22cd67f718b3ffc16ebb7c')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../sdl12-compat-release-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/sdl12-compat-release-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
