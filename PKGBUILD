# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdeclarative
pkgver=6.20.0
pkgrel=2
pkgdesc='Provides integration of QML and KDE Frameworks'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kguiaddons
         kglobalaccel
         kguiaddons
         ki18n
         kwidgetsaddons
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules qt6-shadertools qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('b01c7fa0272dd2cccc962a606e63328825bd3b8c8ec08ee36c3cea75fa8a314d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
