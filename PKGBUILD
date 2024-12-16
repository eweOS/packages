# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kirigami
pkgver=6.9.0
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base
         qt6-declarative
         qt6-svg)
makedepends=(extra-cmake-modules
             qt6-shadertools
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a3429c8bcf40e252d11b0a4c35a43c0433a9835ea1b333580707379b7b5c82c0')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
