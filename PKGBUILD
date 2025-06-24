# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kquickcharts
pkgver=6.15.0
pkgrel=1
pkgdesc='A QtQuick plugin providing high-performance charts'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kirigami
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             qt6-shadertools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('f9f2f4bea577fed8a7f1ddea34617efe74517a492e9c0721f02f2cc08fb6786d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

