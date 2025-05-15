# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kquickcharts
pkgver=6.14.0
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
sha256sums=('dfb33c90eedc7c950e043fb2adf6c8a2df3745e79d2bbcd5e595757448fe98b7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

