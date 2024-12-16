# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=knotifications
pkgver=6.9.0
pkgrel=1
pkgdesc='Abstraction for system notifications'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         libcanberra
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('333fe1bd17a4a918cea6d51fd0535c8b88e1fb2e4f82ca730d0f8b48f0f0422f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

