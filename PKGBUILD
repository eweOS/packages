# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kquickcharts
pkgver=6.6.0
pkgrel=1
pkgdesc='A QtQuick plugin providing high-performance charts'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kirigami
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             qt6-shadertools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d8441008d625763bf7b20a8b1685d09cd69416c6ce4603743e93c16fc5397a47')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

