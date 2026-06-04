# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdeclarative
pkgver=6.26.0
pkgrel=1
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
sha256sums=('9a464e560e436cd3a626ca6aab894f414c6212d2de8b9c5a8eda33be213e00d8')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
