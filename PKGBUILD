# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl12-compat
pkgver=1.2.68
pkgrel=1
pkgdesc="SDL 1.2 runtime compatibility library using SDL 2.0"
url="https://github.com/libsdl-org/sdl12-compat"
depends=('sdl2' 'glu')
makedepends=('cmake')
arch=('x86_64' 'aarch64' 'riscv64')
provides=('sdl1')
license=('MIT')
source=("https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=('63c6e4dcc1154299e6f363c872900be7f3dcb3e42b9f8f57e05442ec3d89d02d')

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
