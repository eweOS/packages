# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kuserfeedback
pkgver=6.15.0
pkgrel=1
pkgdesc='Framework for collecting user feedback for applications via telemetry and surveys'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules
             qt6-charts
             qt6-declarative
             qt6-svg
             qt6-tools)
optdepends=('qt6-charts: Feedback console'
            'qt6-declarative: QML bindings'
            'qt6-svg: Feedback console')
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('0c1ead89ba98f7aa2d3e427620a365cd4f1c9ca30250eec6afb4f90fec187f83')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
