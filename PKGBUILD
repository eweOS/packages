# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kquickcharts
pkgver=6.20.0
pkgrel=1
pkgdesc='A QtQuick plugin providing high-performance charts'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kirigami
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             qt6-shadertools
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('94f52ce42c15cb7dc514ce9868dba41ed8f0645b941ff2256d02227746301792')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_PYTHON_BINDINGS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

