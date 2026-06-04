# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kirigami
pkgver=6.26.0
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base
         qt6-declarative
         qt6-svg)
makedepends=(extra-cmake-modules
             qt6-base-devel
             qt6-shadertools
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('b268785b271198acec7fe4b6177eafdee890e180245c7168916da3ccff1425ff')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
